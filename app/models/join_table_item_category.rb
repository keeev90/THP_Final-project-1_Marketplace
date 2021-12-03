class JoinTableItemCategory < ApplicationRecord
    #Associations
    belongs_to :item
    belongs_to :category

      #Validations
      validates :category, uniqueness: { scope: :item,
        message: "already have this category" }
end
