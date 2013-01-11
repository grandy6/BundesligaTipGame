class AddColumnUserIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :user_id, :integer
  end
end
