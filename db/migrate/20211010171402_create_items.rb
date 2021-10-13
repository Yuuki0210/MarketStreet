class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.text :explanation ,null: false
      t.integer :price ,null: false
      t.boolean :is_active ,null: false, default: false
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
