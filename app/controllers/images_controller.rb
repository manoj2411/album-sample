class ImagesController < ApplicationController

  def new
    @image        = Image.new
    @album_number = params[:album]
  end
end