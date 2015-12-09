# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  country     :string(255)
#  city        :string(255)
#  street_name :string(255)
#  house       :integer
#  zipcode     :string(255)
#  street_type :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
