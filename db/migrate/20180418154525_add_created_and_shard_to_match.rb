class AddCreatedAndShardToMatch < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :created, :datetime
    add_column :matches, :shard, :string
  end
end
