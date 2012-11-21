class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :picture_url
      t.date :birthday
      t.string :sex
      t.boolean :deleted
      t.boolean :email_verfiied

      t.timestamps
    end
  end
end
