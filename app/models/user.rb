class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, confirmation: true
  validates :user_name, presence: true, uniqueness: true
  has_secure_password
end
