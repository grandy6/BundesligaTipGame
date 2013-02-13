class CreateUserMessages < ActiveRecord::Migration
  def change
    create_table :user_messages do |t|
      t.references :user
      t.references :message

      t.timestamps
    end
    add_index :user_messages, :user_id
    add_index :user_messages, :message_id
  end
end
