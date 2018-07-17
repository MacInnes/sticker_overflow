require 'rails_helper'

describe 'Visitor' do
  context 'visits home page' do

    it 'sees all stickers' do
      user = User.create(username: "mac", password: "123", email: "asdf")
      sticker_1 = user.stickers.create(title: "asdf", description: "asdfjh", image_url: "asdf", rating: 4)

      visit root_path
      expect(page).to have_content(sticker_1.title)
    end

    it 'can click on a sticker to view that individual sticker' do
      user = User.create(username: "mac", password: "123", email: "asdf")
      sticker_1 = user.stickers.create(title: "asdf", description: "asdfjh", image_url: "asdf", rating: 4)

      visit root_path
      click_on(sticker_1.title)
      expect(current_path).to eq(sticker_path(sticker_1))
      expect(page).to have_content(sticker_1.title)
    end

  end
end
