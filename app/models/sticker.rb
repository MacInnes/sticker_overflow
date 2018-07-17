class Sticker < ApplicationRecord
  validates_presence_of :title, :description, :image_url, :user_id, :quantity
  belongs_to :user
end
