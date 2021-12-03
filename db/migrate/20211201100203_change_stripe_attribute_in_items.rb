class ChangeStripeAttributeInItems < ActiveRecord::Migration[5.2]
  def change
    change_table :items do |t|
      t.rename :stripe_product_id, :stripe_price_id
    end
  end
end
