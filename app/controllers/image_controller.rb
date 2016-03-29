class ImageController < ApplicationController
  def upload
    @image = Image.new(image_params)
    if @image.save
      render :json => {url: @image.url(:big)}
    else
      render :nothing, status: 400
    end
  end

  def image_params
    params.require(:image).permit(:image)
  end
end
