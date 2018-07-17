require 'rails_helper'

describe 'Registration' do
  it 'a visitor can create a new user' do
    visit root_path

    click_on('Create a new user')

    expect(current_path).to eq(new_user_path)

    user = User.new(username: "asdf", password: "sadfkjh", email: "asdf@gmail.com")

    fill_in :user_username, with: user.username
    fill_in :user_password, with: user.password
    fill_in :user_email, with: user.email
    click_on('Create User')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, #{user.username}")
  end
end
