require 'rails_helper'

describe 'Registration' do
  it 'a visitor can create a new user' do
    visit root_path

    click_on('Create a new user')

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: "sadfkjh"
    fill_in :user_password, with: "jhkfsakh"
    fill_in :user_email, with: "test@gmail.com"
    click_on('Create User')

    expect(current_path).to eq(root_path)
  end
end
