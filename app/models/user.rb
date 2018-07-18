class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :email, require: true

  has_many :messages_from, :class_name => "Message", :foreign_key => "user_from_id"
  has_many :messages_to, :class_name => "Message", :foreign_key => "user_to_id"
  has_many :stickers
  has_secure_password

  enum role: ['default', 'admin']
end
