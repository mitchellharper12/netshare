class Listing < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  validates_presence_of :street, :city, :state, :country

  def address
    [street, city, state, country].join(', ')
  end
end
