require 'rails_helper'

describe User do
  context 'Validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:email)}
  end
  context 'Relationships' do
    it {should have_many(:stickers)}
  end
end
