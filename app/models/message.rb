class Message < ApplicationRecord
  validates_presence_of :header, :body, :user_from_id, :user_to_id
  belongs_to :user
end
