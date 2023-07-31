# frozen_string_literal: true

class CreateFavouriteAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :favourite_albums do |t|
      t.integer :collection_id, null: false
      t.string :thumbnail, null: false
      t.string :title, null: false
      t.string :subtitle, null: false
      t.boolean :favourite, null: false, default: true

      t.timestamps
    end
  end
end
