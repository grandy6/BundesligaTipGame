class CreateNewsCategories < ActiveRecord::Migration
  def change
    create_table :news_categories do |t|
      t.references :news
      t.references :category

      t.timestamps
    end
    add_index :news_categories, :news_id
    add_index :news_categories, :category_id
  end
end
