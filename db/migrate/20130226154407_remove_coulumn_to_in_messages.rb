class RemoveCoulumnToInMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :to
  end

  def down
  end
end
