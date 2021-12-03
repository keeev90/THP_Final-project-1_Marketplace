class AddSellableToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :sellable, :boolean, default: true
  end
end
