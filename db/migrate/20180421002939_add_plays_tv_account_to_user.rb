class AddPlaysTvAccountToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :playstv_account, :string
  end
end
