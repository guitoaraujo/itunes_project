class AlbumsController < ApplicationController
  def index
    if albums_params[:term].present?
      response = HTTParty.get("https://itunes.apple.com/search?term=#{albums_params[:term]}", format: :plain)
      @albums = JSON.parse(response, symbolize_names: true)[:results]
    else
      @albums = []
    end
  end

  private

  def albums_params
    params.permit(:term)
  end
end
