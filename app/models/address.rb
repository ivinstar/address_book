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

class Address < ActiveRecord::Base


  def street
    [self.street_name,self.street_type].join(', ')
  end

end
