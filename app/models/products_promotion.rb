class ProductsPromotion < ApplicationRecord
  belongs_to :product
  belongs_to :promotion
end
