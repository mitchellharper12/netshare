class Request
  include Dynamoid::Document
  table capacity_mode: :on_demand
  field :user_id, :integer
  field :head_count, :integer
  field :street
  field :city
  field :state
  field :country
  field :latitude
  field :longitude
  #geocoded_by :address
  # after_validation :geocode
  belongs_to :user
  validates_presence_of :street, :city, :state, :country

  def address
    [street, city, state, country].join(', ')
  end
end
