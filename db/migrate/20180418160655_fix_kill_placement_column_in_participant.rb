class FixKillPlacementColumnInParticipant < ActiveRecord::Migration[5.0]
  def change
    remove_column :participants, :kill_placement
    add_column :participants, :kill_place, :integer
  end
end
