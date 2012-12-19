class AddPointsToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :points, :float, :default => 0.0
  end
end
