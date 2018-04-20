class AddIndexForMatchAndParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :match_id, :integer
    add_index  :participants, :match_id
  end
end
