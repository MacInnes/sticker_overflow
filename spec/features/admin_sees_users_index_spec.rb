require 'rails_helper'

describe 'User visits users index page' do
  context 'as admin' do
    it 'allows admin to see all users' do
      admin = User.create(username: "kjhsadfkj",
                        password: "ksadfjkfd",
                        email: "asdf@gmail.com",
                        role: 1)
      user_1 = User.create(username: "asdfjkhsdf",
                        password: "ksadfjkfd",
                        email: "asdf@gmail.com",
                        role: 1)
      user_2 = User.create(username: "kjhsadfkj",
                        password: "ksadfjkfd",
                        email: "asdf@gmail.com",
                        role: 1)


      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      expect(page).to have_content("Admin Users:")
      expect(page).to have_content(user_1.username)
      expect(page).to have_content(user_1.email)
      expect(page).to have_content(user_2.username)
      expect(page).to have_content(user_2.email)
    end

    it 'does not allow default user to see admin users index' do
      user = User.create(username: "asfdkjsfk",
                         password: "asfkjsdf",
                         email: "asdfkjh@yahoo.com",
                         role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_users_path

      expect(page).to_not have_content("Admin Users")
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it "an admin can delete a user account" do
      admin = User.create(username: "kjhsadfkj",
                        password: "ksadfjkfd",
                        email: "asdf@gmail.com",
                        role: 1)
      user_1 = User.create(username: "asdfjkhsdf",
                        password: "ksadfjkfd",
                        email: "asdf@gmail.com",
                        role: 1)
      user_2 = User.create(username: "kjhsadfkj",
                        password: "ksadfjkfd",
                        email: "asdf@gmail.com",
                        role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_users_path
      within(".user-#{user_1.id}") do
        click_on("Delete")
      end

      expect(current_path).to eq(admin_users_path)
      expect(page).to_not have_content(user_1.username)
    end
  end
end
