require 'rails_helper'

describe 'User' do
  it 'can click a link from the root to see all messages' do
    user_1 = User.create(username: "asdfkjh", password: "safkjdf", email: "asdf@gmail.com")
    user_2 = User.create(username: "kjfkjfdkj", password: "safkjdf", email: "asdf@gmail.com")

    message_1 = Message.create(header: "hello", body: "body of the message", user_from_id: user_2.id, user_to_id: user_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit root_path

    click_on("Messages")

    expect(current_path).to eq(user_messages_path(user_1))
    expect(page).to have_content(message_1.header)
  end

  it 'can click view to see a message' do
    user_1 = User.create(username: "asdfkjh", password: "safkjdf", email: "asdf@gmail.com")
    user_2 = User.create(username: "kjfkjfdkj", password: "safkjdf", email: "asdf@gmail.com")

    message_1 = Message.create(header: "hello", body: "body of the message", user_from_id: user_2.id, user_to_id: user_1.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit user_messages_path(user_1)

    within(".message-#{message_1.id}") do
      click_on("View")
    end

    expect(current_path).to eq(user_message_path(user_1.id, message_1.id))
    expect(page).to have_content(message_1.body)
  end
end
