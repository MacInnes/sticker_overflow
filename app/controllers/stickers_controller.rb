class StickersController < ApplicationController

  def show
    @sticker = Sticker.find(params[:id])
  end

end
