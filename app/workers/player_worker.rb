class PlayerWorker
    include Sidekiq::Worker
    sidekiq_options :queue => :default

    GAME_MODES = {
        'solo': 'matchesSolo',
        'solo-fpp': 'matchSoloFPP',
        'duo': 'matchesDuo',
        'duo-fpp': 'matchesDuoFPP',
        'squad': 'matchesSquad',
        'squad-fpp': 'matchesSquadFPP',
    }
    
    def perform(player_id)
        player = Player.find(player_id)
        req = RestClient.get "https://api.playbattlegrounds.com/shards/pc-na/seasons", {accept: :json, Authorization: "Bearer #{Rails.application.secrets.PUBG_SECRET}"}
        body = JSON.parse(req.body)
        current_season_id = ''
        body['data'].each { |k|  current_season_id = k['id'] if k['attributes']['isCurrentSeason'] }

        req = RestClient.get "https://api.playbattlegrounds.com/shards/pc-na/players/" + player.player_id + "/seasons/" + current_season_id,
            {accept: :json, Authorization: "Bearer #{Rails.application.secrets.PUBG_SECRET}"}
        body = JSON.parse(req.body)

        body['data']['attributes']['gameModeStats'].each do |game_mode|
            Season.build_season(player, game_mode) unless game_mode[1]["roundsPlayed"] == 0
        end
    end

end