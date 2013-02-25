class ChangeDataTypeInMessages < ActiveRecord::Migration
  def change
    change_column :messages, :from, :integer
    change_column :messages, :to, :integer
  end
end
