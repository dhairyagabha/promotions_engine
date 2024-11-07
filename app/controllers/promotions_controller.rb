class PromotionsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_promotion, except: [:new, :create]

    def index

    end

    def show
    end

    def new
        @promotion = @property.promotions.new
    end

    def create
        @promotion = @property.promotions.new(promotion_params)
        if @promotion.save
            redirect_to property_promotion_conditions_path(@property, @promotion), notice: "Promotion was successfully created."
        else
            render :new, status: :unprocessable_entity, alert: "There were some errors creating the promotion."
        end
    end

    def edit
    end

    def update
        if params[:commit] === "Pending"
            @promotion.pending!
            redirect_to property_promotion_path(@property, @promotion), notice: "Promotion was successfully updated."
        elsif params[:commit] === "Archived"
            @promotion.acrhived!
            redirect_to property_promotion_path(@property, @promotion), notice: "Promotion was successfully updated."
        elsif params[:commit] === "Activate"
            @promotion.active!
            redirect_to property_promotion_path(@property, @promotion), notice: "Promotion was successfully updated."
        else
            if @promotion.update(promotion_params)
                redirect_to property_promotion_path(@property, @promotion), notice: "Promotion was successfully updated."
            else
                render :edit, status: :unprocessable_entity, alert: "There were some errors updating the promotion."
            end
        end
    end

    def review
        @products = {
            included: @promotion.included_products,
            excluded: @promotion.excluded_products,
        }
    end

    def destroy
        @promotion.destroy
        redirect_to property_path(@property), notice: "Promotion was successfully destroyed."
    end

    private

    def set_promotion
        @promotion = @property.promotions.find(params[:promotion_id] || params[:id])
    end

    def promotion_params
        params.require(:promotion).permit(:property, :name, :short_description, :description, :code, :start, :end, :link, :rank, :status)
    end

end
