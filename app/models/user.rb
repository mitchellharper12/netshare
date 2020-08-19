class User
  include Dynamoid::Document
  table capacity_mode: :on_demand
  field :username
  field :email
  field :password_digest
  #field :organization_id
  require 'scrypt'

  belongs_to :organization
  has_many :requests
  has_many :listings
  attr_accessor :password, :password_confirmation
  validates :password, length: { minimum: 6 }, on: :create
  validates_confirmation_of :password, on: :create
  #validates :email, uniqueness: true
  #validates :username, uniqueness: true
  validate do |record|
    same_emails = User.where(email: record.email)
    if same_emails.count > 0 && !same_emails.collect(&:id).include?(record.id)
      record.errors[:email] << "already taken"
    end
    same_username = User.where(username: record.username)
    if same_username.count > 0 && !same_username.collect(&:id).include?(record.id)
      record.errors[:username] << "already taken"
    end
  end
  validate do |record|
    record.errors.add("password", :blank) unless record.send("password_digest").present?
  end

  def set_password_digest(password)
    self.password_digest = SCrypt::Password.create(password)
  end
end
