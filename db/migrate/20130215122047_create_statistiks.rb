class CreateStatistiks < ActiveRecord::Migration
  def change
    create_table :statistiks do |t|

      t.timestamps
    end
  end
end
