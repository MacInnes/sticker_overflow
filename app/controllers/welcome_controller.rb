class WelcomeController < ApplicationController
  def index
    @stickers = Sticker.all
  end
end
