class CreateSeason < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.string :game_mode
      t.integer :assists
      t.integer :boosts
      t.integer :dbnos
      t.integer :daily_kills
      t.integer :damage_dealt
      t.integer :days
      t.integer :headshot_kills
      t.integer :heals
      t.integer :kill_points
      t.integer :kills
      t.integer :longest_kill
      t.integer :longest_time_survived
      t.integer :losses
      t.integer :max_kill_streaks
      t.integer :most_survival_time
      t.integer :revives
      t.integer :ride_distance
      t.integer :road_kills
      t.integer :round_most_kills
      t.integer :rounds_played
      t.integer :suicides
      t.integer :team_kills
      t.integer :time_survived
      t.integer :top_tens
      t.integer :vehicle_destroys
      t.integer :walk_distance
      t.integer :weapons_acquired
      t.integer :weekly_kills
      t.integer :win_points
      t.integer :wins

      t.timestamps
    end
    
    add_column :seasons, :player_id, :integer
    add_index  :seasons, :player_id
  end
end
