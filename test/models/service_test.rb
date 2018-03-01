# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  code        :string
#  name        :string
#  description :string
#  night_price :decimal(, )
#  day_price   :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
