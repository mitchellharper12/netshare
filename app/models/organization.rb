class Organization < ApplicationRecord
  has_many :users
  validates_presence_of :title
  validates :title, length: { in: 4..30 }
end
