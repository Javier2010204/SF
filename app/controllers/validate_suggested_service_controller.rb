class ValidateSuggestedServiceController < ApplicationController
	def index
		service = []
		if params[:service_name].present?
			service_name = params[:service_name]
			condition = "unaccent(lower(description || ' ' || name)) = '#{I18n.transliterate(service_name.downcase)}'"
			service = Service.where(condition)
		end
		if !service.empty?
			result = [valid: true, id: service.first.id, day_price: service.first.day_price]
		else
			result = [valid: false, id: 0]
		end
		render json: result
	end
end