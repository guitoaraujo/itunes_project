# frozen_string_literal: true

class FavouriteAlbum < ApplicationRecord
  validates :collection_id, :thumbnail, :title, :subtitle, presence: true
  validates :collection_id, uniqueness: true
end
