class AddCkeckedToTipps < ActiveRecord::Migration
  def change
  	add_column :tipps, :checked, :boolean, :default => 0
  end
end
