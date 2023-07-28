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
    if @favourite_album.delete
      render json: { favourite_album: @favourite_album }, status: :ok
    else
      render json: { favourite_album: @favourite_album.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_favourite_album
    @favourite_album = FavouriteAlbum.find_by(collection_id: params[:id])
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
