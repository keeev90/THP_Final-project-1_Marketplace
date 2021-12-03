class AddStripeProductToItems < ActiveRecord::Migration[5.2]
  def change
    change_table :items do |t|
      t.string :stripe_product_id
    end
  end
end
