class Season < ApplicationRecord
    belongs_to :player
    
    def self.build_season(player, season)
        new_season = Season.find_by_player_id_and_game_mode(player.id, season[0]) || Season.new
        new_season.update_attributes(
            game_mode: season[0],
            assists: season[1]['assists'],
            boosts: season[1]['boosts'],
            dbnos: season[1]['dBNOs'],
            daily_kills: season[1]['dailyKills'],
            damage_dealt: season[1]['damageDealt'],
            days: season[1]['days'],
            headshot_kills: season[1]['headshotKills'],
            heals: season[1]['heals'],
            kill_points: season[1]['killPoints'],
            kills: season[1]['kills'],
            longest_kill: season[1]['longestKill'],
            longest_time_survived: season[1]['longestTimeSurvived'],
            losses: season[1]['losses'],
            max_kill_streaks: season[1]['maxKillStreaks'],
            most_survival_time: season[1]['mostSurvivalTime'],
            revives: season[1]['revives'],
            ride_distance: season[1]['rideDistance'],
            road_kills: season[1]['roadKills'],
            round_most_kills: season[1]['roundMostKills'],
            rounds_played: season[1]['roundsPlayed'],
            suicides: season[1]['suicides'],
            team_kills: season[1]['teamKills'],
            time_survived: season[1]['timeSurvived'],
            top_tens: season[1]['top10s'],
            vehicle_destroys: season[1]['vehicleDestroys'],
            walk_distance: season[1]['walkDistance'],
            weapons_acquired: season[1]['weaponsAcquired'],
            weekly_kills: season[1]['weeklyKills'],
            win_points: season[1]['winPoints'],
            wins: season[1]['wins'],
            player: player
        )
    end
end
