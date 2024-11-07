class Promotion < ApplicationRecord

    enum :status, [:pending, :active, :archived]

    belongs_to :property
    has_many :products_promotions
    has_many :products, through: :products_promotions
    has_one :condition

    validates_presence_of :name, :description, :short_description, :code, :link, :rank, :status
    # TODO: Update the uniqueness logic to validate on [:property_id, :code]
    validates :code, :name, uniqueness: {scope: :property}

    def included_products
        products.select(:sku).where("products_promotions.relationship = 'include'")
    end

    def excluded_products
        products.select(:sku).where("products_promotions.relationship = 'exclude'")
    end

    def includes_products?(skus)
        products.includes(:products_promotions).where("products_promotions.relationship": :include, sku: skus.split(","))
    end

    def excludes_products?(skus)
        products.includes(:products_promotions).where("products_promotions.relationship": :exclude, sku: skus.split(","))
    end

end
