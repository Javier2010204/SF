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

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
