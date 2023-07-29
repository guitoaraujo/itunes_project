class FavouriteAlbumsController < ApplicationController
  skip_forgery_protection
  before_action :set_favourite_album, only: %i[destroy]

  def create
    favourite_album = FavouriteAlbum.new(favourite_album_params)
    if favourite_album.save
      render json: { favourite_album: favourite_album }, status: :ok
    else
      render json: { favourite_album: favourite_album.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @favourite_album.delete
    head :ok
  end

  private

  def set_favourite_album
    @favourite_album = FavouriteAlbum.find_by(collection_id: params[:id])
    head :not_found if @favourite_album.nil?
  end

  def favourite_album_params
    params.require(:favourite_album).permit(
      :collection_id,
      :thumbnail,
      :title,
      :subtitle,
      :favourite
    )
  end
end
