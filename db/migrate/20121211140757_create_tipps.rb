class CreateTipps < ActiveRecord::Migration
  def change
    create_table :tipps do |t|
      t.integer :team1
      t.integer :team2
      t.integer :points

      t.timestamps
    end
  end
end
