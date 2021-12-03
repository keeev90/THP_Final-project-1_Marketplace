class CreateJoinTableItemOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_item_orders do |t|
      t.integer :quantity, default: 1
      t.belongs_to :item, index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end
