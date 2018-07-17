class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :email, require: true

  has_many :messages
  has_many :stickers
  has_secure_password

  enum role: ['default', 'admin']
end
