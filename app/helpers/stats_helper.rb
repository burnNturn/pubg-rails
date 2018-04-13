module StatsHelper
    def self.find_participant(rosters, ign)
        rosters.each do |roster|
            roster.participants.each do |participant|
                if participant.name == ign
                    return participant
                end
            end
        end
    end
end