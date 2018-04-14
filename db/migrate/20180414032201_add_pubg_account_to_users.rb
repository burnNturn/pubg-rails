class AddPubgAccountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pubg_account, :string
    
  end
end
