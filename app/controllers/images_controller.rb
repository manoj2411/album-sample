class ImagesController < ApplicationController

  def new
    @image        = Image.new
    @album_number = params[:album]
  end

  def index
    _tag = Tag.find_by_name( params[:tag])
    @images = _tag.try(:images)
  end
end