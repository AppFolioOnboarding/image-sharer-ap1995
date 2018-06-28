class WelcomeController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end

  def index
    @images = Image.order('created_at DESC')
  end
end
