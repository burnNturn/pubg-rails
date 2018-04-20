class AddColumnWinPlaceToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :win_place, :integer
  end
end
