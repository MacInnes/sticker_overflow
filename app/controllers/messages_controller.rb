class MessagesController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @messages = Message.where(user_to_id: @user.id).or(Message.where(user_from_id: @user.id))
  end

  def new
    @user = User.find(current_user.id)
    @message = Message.new(user_to_id: params[:user_to_id], user_from_id: @user.id)
  end

  def create
    @message = Message.new(message_params)
    @user = User.find(current_user.id)
    if @message.save
      redirect_to user_messages_path(@user.id)
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private
    def message_params
      params.require(:message).permit(:header, :body, :user_to_id, :user_from_id)
    end

end
