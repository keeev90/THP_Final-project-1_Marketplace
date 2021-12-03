class Cart < ApplicationRecord
  #Associations
  belongs_to :user
  has_many :join_table_item_carts
  has_many :items, through: :join_table_item_carts

  def total_price
    total = 0
    self.join_table_item_carts.each do |order_items|
      total += order_items.item.price * order_items.quantity
    end
    return total
  end
end
