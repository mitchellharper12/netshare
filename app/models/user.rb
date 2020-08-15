class User < ApplicationRecord
  require 'scrypt'

  belongs_to :organization
  has_many :requests
  has_many :listings
  attr_accessor :password, :password_confirmation
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validate do |record|
    record.errors.add("password", :blank) unless record.send("password_digest").present?
  end

  def set_password_digest(password)
    self.password_digest = SCrypt::Password.create(password)
  end
end
