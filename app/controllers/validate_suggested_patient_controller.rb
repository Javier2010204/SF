class ValidateSuggestedPatientController < ApplicationController
	def index
		patient = []
		if params[:patient_nit].present?
			item_description = params[:patient_nit]
			condition = "unaccent(lower(nit)) = '#{I18n.transliterate(patient_nit.downcase)}' "
			patient = Patient.where(condition)
		end
		if !patient.empty?
			result = [valid: true, id: patient.first.id, name: patient.first.first_name]
		else
			result = [valid: false, id: 0]
		end
		render json: result
	end
end
