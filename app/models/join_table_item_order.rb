class JoinTableItemOrder < ApplicationRecord
  #Associations
  belongs_to :item
  belongs_to :order

  #Validations
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
