class AlbumsController < ApplicationController
  def index
    if albums_params[:term].present?
      results = ItunesService.new(albums_params[:term]).call
      @albums = FavouriteAlbumsHandler.new(results).call
    else
      @albums = FavouriteAlbum.where(favourite: true)
    end
  end

  private

  def albums_params
    params.permit(:term)
  end
end
