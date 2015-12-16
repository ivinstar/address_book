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
  include GeneralRepository


  def street
    [self.street_name,self.street_type].join(', ')
  end

  def date
    self.updated_at.utc.strftime('%d.%m.%Y %H:%M')
  end

  def self.ransackable_attributes(auth_object = nil)
      super + %w(street)
  end

  def self.ransackable_scopes(auth_object = nil)
    %w(street_like)
  end

  scope :street_like, ->(val) {
    where("street_name LIKE '%#{val}%' OR street_type LIKE '%#{val}%'")
  }


end
