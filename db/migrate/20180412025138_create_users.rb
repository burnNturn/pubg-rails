class CreateUsers < ActiveRecord::Migration[5.0]
  def change

    remove_column :users, :created_at
    add_column :users, :created_at, :datetime
    add_index :users, :created_at

    change_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
