class ServicesSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(services.name)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			service = Service.where(condition)
			@services.each do |service|
				service.name = service.service_name
			end
		end
		@services ||= service.none

		render json: @services
	end
end