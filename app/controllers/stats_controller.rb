class StatsController < ApplicationController
  def stats_look_up
    client = RUBG::Client.new({:api_key => Rails.application.secrets.PUBG_SECRET})
    if params['search'] && params['platform'] && params['region']
      shard = MATCH_SEARCH_PARAMS[:platform].key(params['platform']).to_s + "-" + MATCH_SEARCH_PARAMS[:region].key(params['region']).to_s
      args = {:shard => shard, :query_params => {:player_names => params['search']}}

      begin
        player_response = client.players(args)
        player = player_response.players.first

        args[:query_params] = {:match_id => player.match_ids[0]}
        match = client.match(args)
        
        player_hash ={
          'id': player.player_id,
          'name': player.name,
          'shard': shard
        }
        
        Player.where(player_hash).first_or_initialize do |k|
          k.save
        end

        @data = {'match': match}
        @data[:participant] = StatsHelper.find_participant(match.rosters, params['search'])
        byebug
      rescue Exception => e
        @error_message = "The in game name used does not exist"
      end
    end
  end
end