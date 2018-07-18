# As a user, when I visit a sticker’s show page, I :
# - [X] 	can see the sticker’s image
# - [X] 	can see the sticker’s quantity
# - [X] 	can message the owner of that sticker
# - [ ] 	can initiate a transaction for that sticker

require 'rails_helper'

describe 'User' do
  context "visits a sticker's show page" do
    it "can see information about that sticker" do
      user_1 = User.create(username: "asdfkjh", password: "safkjdf", email: "asdf@gmail.com")
      user_2 = User.create(username: "kjfkjfdkj", password: "safkjdf", email: "asdf@gmail.com")

      sticker = user_2.stickers.create(title: "asdf", description: "safdjk", image_url: "www.google.com", quantity: 20)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit sticker_path(sticker)

      expect(page).to have_content(sticker.title)
      expect(page).to have_content(sticker.description)
      expect(page).to have_content(sticker.quantity)
    end

    it 'can message the owner of that sticker' do
      user_1 = User.create(username: "asdfkjh", password: "safkjdf", email: "asdf@gmail.com")
      user_2 = User.create(username: "kjfkjfdkj", password: "safkjdf", email: "asdf@gmail.com")

      sticker = user_2.stickers.create(title: "asdf", description: "safdjk", image_url: "www.google.com", quantity: 20)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit sticker_path(sticker)

      click_button("Message this User")

      expect(current_path).to eq(new_user_message_path(user_1))

      message = Message.new(header: "asdf", body: "asdf", user_to_id: user_2.id)
      fill_in :message_header, with: message.header
      fill_in :message_body, with: message.body
      click_button("Send Message")

      expect(current_path).to eq(user_messages_path(user_1))
      expect(page).to have_content(message.header)
      expect(page).to have_content(message.body)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_2)

      visit user_messages_path(user_2)
      expect(page).to have_content(message.header)
      expect(page).to have_content(message.body)

    end
  end
end
