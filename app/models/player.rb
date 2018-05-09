class Player < ApplicationRecord
    has_many :participants
    has_many :seasons

    after_commit :create_season

    def create_season
        PlayerWorker.perform_async(self.id)
    end
end
