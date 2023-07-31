# frozen_string_literal: true

require 'rails_helper'

describe AlbumsController, type: :controller do
  let!(:favourite_album1) { create(:favourite_album) }
  let!(:favourite_album2) { create(:favourite_album, favourite: false) }
  let!(:itunes_service_result) do
    [
      {
        thumbnail: favourite_album1.thumbnail,
        title: favourite_album1.title,
        subtitle: favourite_album1.subtitle,
        collection_id: favourite_album1.collection_id,
        favourite: false
      }
    ]
  end
  let!(:favourite_albums_handler_result) do
    itunes_service_result[0][:favourite] = true
    itunes_service_result
  end

  context 'GET albums#index' do
    context 'when term is present' do
      before do
        allow_any_instance_of(ItunesService).to receive(:call).and_return(itunes_service_result)
        allow_any_instance_of(FavouriteAlbumsHandler).to receive(:call).and_return(favourite_albums_handler_result)
      end
      it 'returns itunes results plus favourite albums with favourite true' do
        get :index, params: { term: favourite_album1.title }

        albums = assigns(:albums)
        expect(albums).to eq(favourite_albums_handler_result)
      end
    end
    context 'when term is not present' do
      it 'returns just favourite albums with favourite true' do
        get :index

        albums = assigns(:albums)
        expect(albums).to eq([favourite_album1])
      end
    end
  end
end
