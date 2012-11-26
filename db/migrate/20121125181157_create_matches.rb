class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :match_number
      t.datetime :match_date_time
      t.string :time_zone_id
      t.datetime :match_date_time_utc
      t.integer :group_id
      t.integer :group_order_id
      t.string :group_name
      t.integer :league_id
      t.string :league_name
      t.string :league_saison
      t.string :league_shortcut
      t.string :name_team1
      t.string :name_team2
      t.integer :id_team1
      t.integer :id_team2
      t.string :icon_url_team1
      t.string :icon_url_team2
      t.integer :points_team1
      t.integer :points_team2
      t.datetime :last_update
      t.boolean :match_is_finished

      t.timestamps
    end
  end
end
