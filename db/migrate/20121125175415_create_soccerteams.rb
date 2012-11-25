class CreateSoccerteams < ActiveRecord::Migration
  def change
    create_table :soccerteams do |t|
      t.integer :team_number
      t.string :team_name
      t.string :team_icon_url

      t.timestamps
    end
  end
end
