class Service < ApplicationRecord
	has_many :sales

	def service_name
		self.name ? ' ' 
	end
end
