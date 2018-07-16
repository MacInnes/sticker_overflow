require 'rails_helper'

describe Message do
  context 'Validations' do
    it {should validate_presence_of(:header)}
    it {should validate_presence_of(:body)}
    it {should validate_presence_of(:user_from_id)}
    it {should validate_presence_of(:user_to_id)}
  end
end
