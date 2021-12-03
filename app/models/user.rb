class User < ApplicationRecord
  #Callbacks
  # after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Associations
  has_one :cart
  has_many :orders
  # has_many :join_table_item_orders
  # has_many :join_table_item_carts


  #Validations
  # validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Merci de renseigner une adresse email valide." }

  private

  after_initialize do |user|
    self.cart ||= Cart.create(user: user)
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
end
