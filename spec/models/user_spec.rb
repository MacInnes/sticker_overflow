require 'rails_helper'

describe User do
  context 'Validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:email)}
    it 'uniqueness of username' do
      user = User.create(username: "asdfjk", password: "sadkfj", email: "asdf@gmail.com")
      user_2 = User.create(username: "asdfjk", password: "sadkfj", email: "asdf@gmail.com")

      expect(user_2).to_not be_valid
    end
  end
  context 'Relationships' do
    it {should have_many(:stickers)}
  end
  context "Roles" do
    it "can be created as an admin" do
      user = User.create(username: "sadfkj",
                         password: "safdjkh",
                         email: "asdf@gmail.com",
                         role: 1)

      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "can be created as a default user" do
      user = User.create(username: "faskjhg",
                         password: "password",
                         email: "asdf@gmail.com",
                         role: 0)

      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end
  end
end
