class User < ApplicationRecord
  has_secure_password
  has_many :twitter_accounts
  has_many :tweets
  validates :email , presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'email must be valid' }
end
