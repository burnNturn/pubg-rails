class StatsController < ApplicationController
  def stats_look_up
    client = RUBG::Client.new({:api_key => Rails.application.secrets.PUBG_SECRET})
    if params['search'] && params['platform'] && params['region']
      args = {:shard => params['platform'] + "-" + params['region'], :query_params => {:player_names => params['search']}}
      begin
        player_response = client.players(args)
        args[:query_params] = {:match_id => player_response.players.first.match_ids[0]}
        match = client.match(args)
        @data = {}
        @data['participant'] = StatsHelper.find_participant(match.rosters, params['search'])
      rescue Exception => e
        @error_message = "The in game name used does not exist"
      end
    end
  end
end