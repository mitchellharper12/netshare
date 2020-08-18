class User
  include Dynamoid::Document
  table capacity_mode: :on_demand
  field :username
  field :email
  field :password_digest
  field :organization_id, :integer
  require 'scrypt'

  belongs_to :organization
  has_many :requests
  has_many :listings
  attr_accessor :password, :password_confirmation
  validates :password, length: { minimum: 6 }
  validates_confirmation_of :password
  #validates :email, uniqueness: true
  #validates :username, uniqueness: true
  validate do |record|
    if User.where(email: record.email)
      record.errors[:email] << "Email is already taken"
    end
    if User.where(username: record.username)
      record.errors[:username] << "Username is already taken"
    end
  end
  validate do |record|
    record.errors.add("password", :blank) unless record.send("password_digest").present?
  end

  def set_password_digest(password)
    self.password_digest = SCrypt::Password.create(password)
  end
end
