json.set! :promotions do
    json.array! @promotions, partial: "promotion", as: :promotion
end
if @unauthorized_params.any?
    json.set! :unauthorized_params do
        json.set! :description, "These parameters are not valid attributes on the property and will not be taken into consideration."
        json.set! :parameters, @unauthorized_params
    end
end