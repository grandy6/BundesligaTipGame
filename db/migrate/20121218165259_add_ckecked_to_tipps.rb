class AddCkeckedToTipps < ActiveRecord::Migration
  def change
  	add_column :tipps, :checked, :boolean, :default => false
  end
end
