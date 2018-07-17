require 'rails_helper'

describe 'User' do

  it 'can view all of his stickers' do
    user = User.create(username: "asfdjkhsd", password: "asfkh", email: "asdf@gmail.com")
    other_user = User.create(username: "kjfsdgkj", password: "kjhasf", email: "asfkjh@gmail.com")

    user_sticker_1 = user.stickers.create(title: "kjfs", description: "sdfkhsd", quantity: 20, image_url: "http://placekitten.com/200/200")
    user_sticker_2 = user.stickers.create(title: "asdf", description: "sdfkhsd", quantity: 20, image_url: "http://placekitten.com/200/200")
    other_user_sticker_1 = other_user.stickers.create(title: "kjdsfkj", description: "sdfkhsd", quantity: 20, image_url: "http://placekitten.com/200/200")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    expect(page).to have_content("Title: #{user_sticker_1.title}")
    expect(page).to have_content("Title: #{user_sticker_2.title}")
    expect(page).to_not have_content("Title: #{other_user_sticker_1.title}")
  end

  it 'can edit the details of a sticker' do
    user = User.create(username: "asfdjkhsd", password: "asfkh", email: "asdf@gmail.com")

    user_sticker_1 = user.stickers.create(title: "kjfs", description: "sdfkhsd", quantity: 20, image_url: "http://placekitten.com/200/200")
    user_sticker_2 = user.stickers.create(title: "asdf", description: "sdfkhsd", quantity: 20, image_url: "http://placekitten.com/200/200")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    within(".sticker-#{user_sticker_1.id}") do
      click_button("Edit")
    end

    new_title = "jhkewriuhsj"
    new_description = "asdfkjsdkdsflkjsa"
    new_quantity = 99

    fill_in :sticker_title, with: new_title
    fill_in :sticker_description, with: new_description
    fill_in :sticker_quantity, with: new_quantity
    click_on("Update Sticker")
    
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Title: #{new_title}")
    expect(page).to have_content("Description: #{new_description}")
    expect(page).to have_content("Quantity: #{new_quantity}")
  end
end
