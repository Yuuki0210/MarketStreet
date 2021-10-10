class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.integer :piece, null: false
      t.integer :texed_price, null: false

      t.timestamps
    end
  end
end
