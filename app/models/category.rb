class Category < ApplicationRecord
    has_many :shop_category_relations, dependent: :delete_all
    has_many :shops, through: :shop_category_relations
end
