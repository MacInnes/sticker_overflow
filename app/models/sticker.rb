class Sticker < ApplicationRecord
  validates_presence_of :title, :description, :image_url, :rating, :user_id
  belongs_to :user
end
