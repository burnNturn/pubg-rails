class Participant < ApplicationRecord
    belongs_to :player
    belongs_to :match
    
    def self.build_or_find_participant(participant, match, is_winner = false)
        player = Player.find_by_player_id(participant.player_id)
        Participant.where(player: player, match: match).first_or_create do |k|
            k.dbnos = participant.dbnos,
            k.assists = participant.assists,
            k.boosts = participant.boosts,
            k.damage_dealt = participant.damage_dealt,
            k.headshot_kills = participant.headshot_kills,
            k.heals = participant.heals,
            k.kill_place = participant.kill_place,
            k.kill_streaks = participant.kill_streaks,
            k.kills = participant.kills,
            k.longest_kill = participant.longest_kill,
            k.revives = participant.revives,
            k.ride_distance = participant.ride_distance,
            k.road_kills = participant.road_kills,
            k.team_kills = participant.team_kills,
            k.time_survived = participant.time_survived,
            k.vehicle_destroys = participant.vehicle_destroys,
            k.walk_distance = participant.walk_distance,
            k.weapons_acquired = participant.weapons_acquired,
            k.kill_ranking_before = participant.kill_ranking_before,
            k.kill_ranking_gained = participant.kill_ranking_gained,
            k.win_ranking_before = participant.win_ranking_before,
            k.win_ranking_gained = participant.win_ranking_gained,
            k.overall_ranking_gained = participant.overall_ranking_gained,
            k.winner = is_winner
            k.win_place = participant.win_place
            k.death_type = participant.death_type
        end
    end
end
