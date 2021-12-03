class Category < ApplicationRecord
    #Associations
    has_many :join_table_item_categories
    has_many :items, through: :join_table_item_categories

end
