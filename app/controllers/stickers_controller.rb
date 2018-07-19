class StickersController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :destroy, :index]

  def show
    @sticker = Sticker.find(params[:id])

  end

  def new
    @sticker = Sticker.new
  end

  def create
    user = current_user
    @sticker = user.stickers.new(sticker_params)
    if @sticker.save
      # TODO: add if else for save with flash messages
      redirect_to root_path
    else
      render :new
    end

  end

  def edit
    @sticker = Sticker.find(params[:id])
  end

  def update
    sticker = Sticker.find(params[:id])
    sticker.update(sticker_params)
    redirect_to user_path(sticker.user)
  end

  def destroy
    sticker = Sticker.find(params[:id])
    sticker.destroy
    redirect_to user_path(sticker.user)
  end


  private
    def require_user
      render file: "/public/404" unless current_user?
    end

    def sticker_params
      params.require(:sticker).permit(:title, :description, :quantity, :image_url)
    end

end
