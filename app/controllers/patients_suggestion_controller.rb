class PatientsSuggestionController < ApplicationController
	def index
		if params[:query].present?
			query = params[:query]
			condition1 = "unaccent(lower(patients.nit)) LIKE '%#{I18n.transliterate(query.downcase)}%'"
			@patients = Patient.where(condition1)
		end
		@patients ||= none
		render json: @patients
	end
end
