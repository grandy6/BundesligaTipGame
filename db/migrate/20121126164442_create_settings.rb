class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :league_id
      t.string :league_short
      t.string :league_saison
      t.datetime :last_change

      t.timestamps
    end
  end
end
