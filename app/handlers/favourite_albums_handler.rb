# frozen_string_literal: true

class FavouriteAlbumsHandler
  def initialize(results)
    @results = results
    @favourite_albums = FavouriteAlbum.where(favourite: true)
  end

  def call
    return @results unless @favourite_albums.any?

    ids = @results.map { |result| result[:collection_id] }
    @favourite_albums.each do |album|
      next unless ids.include? album.collection_id

      @results.find { |result| result[:collection_id] == album.collection_id }[:favourite] = true
    end
    @results
  end
end
