class ImagesController < ApplicationController
  def new; end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to image_path(@image)
    else
      flash.now[:danger] = 'Invalid URL'
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:images).permit(:link)
  end
end
