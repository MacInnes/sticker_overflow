class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      # TODO: success flash message
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      # TODO: error flash message
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
