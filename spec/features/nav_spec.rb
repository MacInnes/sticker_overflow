require 'rails_helper'

describe 'Nav' do
  context 'User' do

    it "can navigate to user's homepage" do
      user = User.create(username: "kjhfskj", password: "sdfkjsfoi", email: "sadf@gmail.com")
      other_user = User.create(username: "dsfjkhsd", password: "sdfkjsfoi", email: "sfkjhsf@gmail.com")
      sticker = user.stickers.create(title: "sdf", description: "asflkj", quantity: 29, image_url: "www.google.com")
      other_sticker = other_user.stickers.create(title: "sdkjsdfkjnf", description: "asflkj", quantity: 29, image_url: "www.google.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on(user.username)
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(sticker.title)
      expect(page).to_not have_content(other_sticker.title)
    end

    it "can navigate to see user messages" do
      user = User.create(username: "asdfkjh", password: "safkjdf", email: "asdf@gmail.com")
      other_user = User.create(username: "kjfkjfdkj", password: "safkjdf", email: "asdf@gmail.com")

      message_1 = Message.create(header: "hello", body: "body of the message", user_from_id: other_user.id, user_to_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      click_on("Messages")
      expect(current_path).to eq(user_messages_path(user))
      expect(page).to have_content(message_1.header)
    end

    it "can logout" do
      user = User.create(username: "Mac", password: "123", email: "asdf@gmial.com")
      visit root_path
      click_on("Login")

      fill_in :username, with: user.username
      fill_in :password, with: user.password
      click_on("Login")

      visit root_path
      click_on("Logout")

      expect(current_path).to eq(root_path)
      expect(page).to_not have_content("Welcome, #{user.username}!")
    end
  end
end
