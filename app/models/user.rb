class User < ActiveRecord::Base
  validates_presence_of :password_confirmation
  has_secure_password

  has_many :reviews

  validates :email, uniqueness: { case_sensitive: false }
  validates_presence_of :email, :first_name, :last_name
  validates :password, length: { minimum: 3 }
end
