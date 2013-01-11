class AddColumnsForTableToSoccerteams < ActiveRecord::Migration
  def change
  	add_column :soccerteams, :matches, :integer, :default => 0
  	add_column :soccerteams, :win, :integer, :default => 0
  	add_column :soccerteams, :drawn, :integer, :default => 0
  	add_column :soccerteams, :lost, :integer, :default => 0
  	add_column :soccerteams, :goals_for, :integer, :default => 0
  	add_column :soccerteams, :goals_against, :integer, :default => 0
  	add_column :soccerteams, :points, :integer, :default => 0
  end
end
