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

  paginates_per 100

  validates :country, :city, :street_name, :street_type, :house, presence: true
  validates :house, numericality: { greater_than: 0 }


  def to_s
    [self.street,self.house].join(', ')
  end

  def street
    [self.street_name,self.street_type].join(', ')
  end

  def date
    self.updated_at.utc.strftime('%d.%m.%Y')
  end

  def self.ransackable_attributes(auth_object = nil)
      super + %w(street)
  end

  def self.ransackable_scopes(auth_object = nil)
    %w(street_like)
  end

  scope :street_like, ->(val) {
    val = val.split(/\s|,/).join('%')
    where("street_name LIKE '#{val}%' OR street_type LIKE '#{val}%' OR CONCAT(street_name, street_type) LIKE '#{val}%'")
  }


end
