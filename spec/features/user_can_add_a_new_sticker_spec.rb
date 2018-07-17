require 'rails_helper'

describe 'Adding stickers' do
  context 'User' do
    it 'can add a sticker' do
      user = User.create(username: "kjsdf", password: "sdfjkhsdf", email: "sadf@gmail.com")
      sticker = user.stickers.new(title: "asfd", description: "asdfasfd", quantity: 5, image_url: "google.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      # expect(page).to have_content("Add a new sticker")

      click_button("Add a new sticker")

      expect(current_path).to eq(new_sticker_path)

      fill_in :sticker_title, with: sticker.title
      fill_in :sticker_description, with: sticker.description
      fill_in :sticker_image_url, with: sticker.image_url
      fill_in :sticker_quantity, with: sticker.quantity
      click_on("Create Sticker")

      expect(current_path).to eq(root_path)
      expect(page).to have_content(sticker.title)

    end
  end
  context 'Visitor' do
    it 'cannot add a new sticker' do
      visit root_path

      expect(page).to_not have_content("Add a new sticker")

      visit new_sticker_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
