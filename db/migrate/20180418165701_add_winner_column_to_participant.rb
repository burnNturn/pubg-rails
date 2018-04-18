class AddWinnerColumnToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :winner, :boolean
  end
end
