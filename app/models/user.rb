class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, confirmation: true
  has_secure_password
end
