class JoinTableItemCart < ApplicationRecord
  #Associations
  belongs_to :item
  belongs_to :cart

  #Validations
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
