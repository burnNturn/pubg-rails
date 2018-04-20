class AddPreferredWeaponToParticipants < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :preferred_weapon, :string
  end
end
