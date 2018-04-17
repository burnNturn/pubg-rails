class CreateUsers < ActiveRecord::Migration[5.0]
  def change

      remove_column :users, :created_at
      add_column :users, :created_at, :datetime
      add_index :users, :created_at

      add_column :users, :provider, :string
      add_column :users, :uid, :string
      add_column :users, :name, :string
      add_column :users, :oauth_token, :string
      add_column :users, :oauth_expires_at, :datetime

      #t.timestamps
  end
end
