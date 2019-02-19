class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.string :img_url
      t.integer :price

      t.timestamps
    end
  end
end
