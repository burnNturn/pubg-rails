class StatsController < ApplicationController
  def stats_look_up
    client = RUBG::Client.new({:api_key => Rails.application.secrets.PUBG_SECRET})
    if params['search'] && params['platform'] && params['region']
      shard = MATCH_SEARCH_PARAMS[:platform].key(params['platform']).to_s + "-" + MATCH_SEARCH_PARAMS[:region].key(params['region']).to_s
      args = {:shard => shard, :query_params => {:player_names => params['search']}}

      begin
        player_response = client.players(args)
        player = player_response.players.first

        player_hash = {
          'player_id': player.player_id,
          'name': player.name,
          'shard': shard
        }

        player_record = Player.where(player_hash).first_or_create do |k|
          k.save
        end
        if !(match = Match.find_by_match_id(player.match_ids[0]))

          args[:query_params] = {:match_id => player.match_ids[0]}
          match = client.match(args)
          participant = StatsHelper.find_participant(match.rosters, params['search'])

          Match.transaction do
            Participant.transaction do
              winners = match.winners.participants 

              match = Match.create(
                match_id: match.match_id,
                duration: match.duration,
                mode: match.mode,
                map: match.map,
                telemetry_link: match.telemetry_link,
                player_count: match.player_count,
                roster_count: match.roster_count,
                shard: shard,
                created: match.created
              )

              TelemetryWorker.perform_async(match.telemetry_link, params['search'])

              winners.each do |p|
                player_hash = {
                  'player_id': p.player_id,
                  'name': p.name,
                  'shard': shard
                }
                Player.where(player_hash).first_or_create do |k|
                  k.save
                end
                
                Participant.build_or_find_participant(p, match, true)
              end
            end
          end
          
          #if the participant wasnt created already, do so now!
          participant = Participant.build_or_find_participant(participant, match)
        else

          participant = Participant.find_by(match: match, player: player_record)
        end

        winners = Participant.where(match: match, winner: true)
        
        @data = {
          'match': match,
          'participant': participant,
          'winners': winners
        }
      rescue Exception => e
        @error_message = "The in game name used does not exist"
      end
    end
  end
end