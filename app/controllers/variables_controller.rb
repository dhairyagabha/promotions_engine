class VariablesController < ApplicationController

    before_action :authenticate_user!
    before_action :set_variable, except: [:index, :new, :create]

    def index
        @variables = @property.variables
    end

    def show
    end

    def new
        @variable = @property.variables.new
    end

    def create
        @variable = @property.variables.new(variable_params)
        if @variable.save
            redirect_to property_variables_path(@property), notice: "Variable was successfully created."
        else
            render :new, status: :unprocessable_entity, alert: "There were some errors creating the variable."
        end
    end

    def edit
    end

    def update
        if @variable.update(variable_params)
            redirect_to property_variables_path(@property), notice: "Variable was successfully updated."
        else
            render :edit, status: :unprocessable_entity, alert: "There were some errors updating the variable."
        end
    end

    def destroy
        @variable.destroy
        redirect_to property_variables_path(@property), notice: "Variable was successfully destroyed."
    end

    private

    def set_variable
        @variable = @property.variables.find(params[:id])
    end

    def variable_params
        params.require(:variable).permit(:property, :name, :description, :key, :value_type, :possible_values)
    end

end
