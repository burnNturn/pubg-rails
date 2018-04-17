class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :player_id
      t.string :name
      t.datetime :created
      t.datetime :updated
      t.string :patch_version
      t.string :shard
      t.string :stats
      t.string :title_id
      t.string :link

      t.timestamps
    end
  end
end
