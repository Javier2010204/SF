# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  number     :integer
#  date       :date
#  state      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :integer
#  nit        :string
#  client     :string
#  tipo_pago  :string
#  estado     :string           default("inprogress")
#

class Sale < ApplicationRecord
	include AASM
	has_many :sale_details, inverse_of: :sale,  dependent: :destroy
	has_many :items, through: :sale_details
	belongs_to :user
	belongs_to :patient
	belongs_to :client
	validates :number, presence: true
	validates :date, presence: true

	accepts_nested_attributes_for :sale_details, reject_if: :sale_detail_rejectable?, allow_destroy: true

	enum state: [:draft, :confirmed]

	aasm column: "estado" do
		state :inprogress, initial: true
		state :ending

		event :finished do
			transitions from: :inprogress, to: :ending
		end
	end

	def client_nit
	  client.try(:nit)
	end

	def client_nit=(nit)
	  self.client = Client.find_or_create_by(nit: nit) if nit.present?
	end


	def total
		details = self.sale_details

		total = 0.0
		details.flat_map do |d|
			total += d.qty * d.price
		end
		total
	end

	private
		def sale_detail_rejectable?(att)
			att[:item_id].blank? || att[:qty].blank? || att[:price].blank? || att[:qty].to_f <= 0 || att[:price].to_f <= 01
		end
end
