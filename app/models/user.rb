class User < ActiveRecord::Base
  has_many :comments
  has_many :posts

  validates :email, presence: true, uniqueness: true, confirmation: true
  validates :user_name, presence: true, uniqueness: true
  has_secure_password
end
