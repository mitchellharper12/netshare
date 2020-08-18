class Organization
  include Dynamoid::Document
  table capacity_mode: :on_demand
  field :title
  has_many :users
  validates_presence_of :title
  validates :title, length: { in: 4..30 }
end
