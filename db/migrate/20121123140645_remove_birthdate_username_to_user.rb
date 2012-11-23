class RemoveBirthdateUsernameToUser < ActiveRecord::Migration
  def up
  	remove_column :users, :birthdate
  end

  def down
  end
end
