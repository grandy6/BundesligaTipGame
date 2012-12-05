class AddTypeToTeam < ActiveRecord::Migration
  def change
  	add_column :teams, :is_public, :boolean
  end
end
