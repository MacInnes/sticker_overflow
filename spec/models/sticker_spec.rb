require 'rails_helper'

describe Sticker do
  context 'Validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:image_url)}
    it {should validate_presence_of(:quantity)}
  end
  context 'Relationships' do
    it {should belong_to(:user)}
  end
end
