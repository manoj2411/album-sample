class AlbumsController < ApplicationController

  def new
    @album = Album.new
    @album.images.build
  end
end