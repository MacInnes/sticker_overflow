class MessagesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @messages = Message.where(user_to_id: @user.id)
  end
end
