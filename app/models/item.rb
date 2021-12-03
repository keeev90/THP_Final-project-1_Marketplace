class Item < ApplicationRecord
  before_validation :create_stripe_product

  #Associations
  has_many :join_table_item_carts
  has_many :carts, through: :join_table_item_carts
  
  has_many :join_table_item_orders
  has_many :orders, through: :join_table_item_orders

  has_many :join_table_item_categories
  has_many :categories, through: :join_table_item_categories

  has_one_attached :item_picture

  #Validations
  validates :title, presence: true, length: { in: 3..140, message: ": Le nombre de caractères doit être compris entre 3 et 140" }
  validates :description, presence: true, length: { in: 10..1000, message: ": Le nombre de caractères doit être compris entre 10 et 1000" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 999, message: "Petit gourmand ! Le prix doit être inférieur ou égal à 999€.", only_integer: true }
  validates :image_url, presence: true
  # validate :has_item_picture?

  def stripe_price
    Stripe::Price.retrieve(self.stripe_price_id)
  end

  def stripe_product
    Stripe::Product.retrieve(self.stripe_price.product)
  end

  private

  def has_item_picture?
    unless self.item_picture.attached?
      errors.add(:item_picture, "Merci d'ajouter une photo.")
    end
  end

  def create_stripe_product
    if self.image_url !=""
          unless self.stripe_price_id
      stripe_product = Stripe::Product.create({
        name: title,
        description: description,
        shippable: false,
        images: [image_url]
      })

      stripe_price = Stripe::Price.create({
        product: stripe_product.id,
        unit_amount: price * 100,
        currency: 'eur'
      })

      self.stripe_price_id = stripe_price.id

      self.save
    end
    end

  end
end
