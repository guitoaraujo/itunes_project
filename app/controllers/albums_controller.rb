class AlbumsController < ApplicationController
  def index
    @albums = []
    return @albums unless albums_params[:term].present?

    @albums = ItunesService.new(albums_params[:term]).call
  end

  private

  def albums_params
    params.permit(:term)
  end
end
