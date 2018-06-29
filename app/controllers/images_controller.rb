class ImagesController < ApplicationController
  def new; end

  def index
    @images = Image.order('created_at DESC')
    flash[:danger] = 'Empty Database' if @images.empty?
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = 'Image successfully saved!'
      redirect_to image_path(@image)
    else
      flash.now[:danger] = 'Invalid URL'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @image = Image.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render :new, status: :unprocessable_entity
  end

  private

  def image_params
    params.require(:image).permit(:link)
  end
end
