class RemovePriceFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :price, :decimal
  end
end
