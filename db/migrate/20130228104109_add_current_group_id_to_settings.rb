class AddCurrentGroupIdToSettings < ActiveRecord::Migration
  def change
  	add_column :settings, :current_group_id, :integer
  end
end
