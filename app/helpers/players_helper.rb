module PlayersHelper
    def self.get_kill_death_ratio(player)
        player.seasons.pluck(:kills).sum.to_f / player.seasons.pluck(:rounds_played).sum.to_f
    end
end