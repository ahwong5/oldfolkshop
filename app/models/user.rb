class User < ApplicationRecord
  has_secure_password
  has_many :orders
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: true,
                    length: { minimum: 10 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :firstname, presence: true,
                        length: { minimum: 2 }
  validates :lastname, presence: true,
                       length: { minimum: 2 }
  enum role: [:user, :moderator, :admin]
end
