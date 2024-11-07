class CsvImportService
	require "csv"

	def import_products(file, property)
		opened_file = File.open(file)
		options = {headers: true, col_sep: ","}
		skus = []
		productPromotions = []
		CSV.foreach(opened_file, **options) do |row|
			skus.push({sku: row["Catalog Number"], property_id: property.id})
		end
		Product.upsert_all(skus, unique_by: [:property_id, :sku])
	end

	def build_relationships(file, property, pmid, relationship)
		opened_file = File.open(file)
		options = {headers: true, col_sep: ","}
		skus = []
		relationships = []
		CSV.foreach(opened_file, **options) do |row|
			skus.push(row["Catalog Number"])
		end
		products = Product.where(property_id: property.id, sku: skus)
		products.each do |p|
			relationships.push({promotion_id: pmid, product_id: p.id, relationship: relationship})
		end
		ProductsPromotion.upsert_all(relationships, unique_by: [:promotion_id, :product_id], update_only: [:relationship])
	end
end