class ProductsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_product, except: [:index, :new, :create, :import]

    def index
        @products = @property.products
    end

    def new
        @product = @property.products.new
    end

    def create
        @product = @property.products.new(promotion_params)
        if @product.save
            redirect_to property_products_path(@property), notice: "Product was successfully created."
        else
            render :new, status: :unprocessable_entity, alert: "There were some errors creating the product."
        end
    end

    def edit
    end

    def update        
        if @product.update(product_params)
            redirect_to property_products_path(@property), notice: "Product was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def import
        return redirect_to request.referrer, notice: "No file added" if params[:file].nil?
        return redirect_to request.referrer, notice: "Only CSV files allowed" unless params[:file].content_type == "text/csv"

        CsvImportService.new.import_products(params[:file], @property)
        CsvImportService.new.build_relationships(params[:file], @property, params[:promotion_id], params[:relationship])

        redirect_to request.referrer, notice: "#{(params[:relationship] + "d").capitalize} products imported."
    end

    def destroy
        @product.destroy
        redirect_to property_products_path(@property), notice: "Product was successfully destroyed."
    end

    private

    def set_product
        @product = @property.products.find(params[:id])
    end

    def promotion_params
        params.require(:product).permit(:property, :sku)
    end

end
