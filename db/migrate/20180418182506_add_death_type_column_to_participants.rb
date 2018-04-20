class AddDeathTypeColumnToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :death_type, :string
  end
end
