require 'rails_helper'

describe 'Login' do
  it 'a visitor with an existing account can view the login form' do
    visit root_path

    user = User.create(username: "asdfasdf", password: "khfaljhks", email: "test@gmail.com")

    click_on("Login")

    expect(current_path).to eq(login_path)

    fill_in :username, with: user.username
    fill_in :password, with: user.password
    within(".login-form") do
      click_on("Login")
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to_not have_content("Login")
  end
end
