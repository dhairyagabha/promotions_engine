class Product < ApplicationRecord
  belongs_to :property
  has_many :products_promotions
  has_many :promotions, through: :products_promotions

  before_save :trim_whitespace

  def trim_whitespace
    self.sku.strip
  end

end
