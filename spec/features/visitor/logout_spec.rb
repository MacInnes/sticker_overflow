require 'rails_helper'

describe 'Logout' do
  it 'a logged in user can logout' do
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
    click_on("Logout")

    expect(current_path).to eq(root_path)
  end
end
