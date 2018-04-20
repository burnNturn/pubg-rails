class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :match_id
      t.integer :duration
      t.string :mode
      t.string :map
      t.string :telemetry_link
      t.integer :player_count
      t.integer :roster_count
      
      t.timestamps
    end
    
    create_table :participants do |t|
      t.integer :dbnos
      t.integer :assists
      t.integer :boosts
      t.integer :damage_dealt
      t.integer :damage_dealt
      t.integer :headshot_kills
      t.integer :heals
      t.integer :kill_placement
      t.integer :kill_streaks
      t.integer :kills
      t.integer :longest_kill
      t.integer :revives
      t.integer :ride_distance
      t.integer :road_kills
      t.integer :team_kills
      t.integer :time_survived
      t.integer :vehicle_destroys
      t.integer :walk_distance
      t.string :weapons_acquired
      
      t.integer :kill_ranking_before
      t.integer :kill_ranking_gained
      t.integer :win_ranking_before
      t.integer :win_ranking_gained
      t.integer :overall_ranking_gained
    end
    
    add_column :participants, :player_id, :integer
    add_index  :participants, :player_id
  end
end