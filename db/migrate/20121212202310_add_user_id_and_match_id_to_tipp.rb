class AddUserIdAndMatchIdToTipp < ActiveRecord::Migration
  def change
  	add_column :tipps, :user_id, :integer
  	add_column :tipps, :match_id, :integer
  end
end
