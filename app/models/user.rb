class User < ApplicationRecord
  has_secure_password
  has_many  :books
  validates :username, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
