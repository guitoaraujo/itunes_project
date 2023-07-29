require 'rails_helper'

describe FavouriteAlbumsController, type: :controller do
  let(:favourite_album) { create(:favourite_album) }

  context "POST favourite_albums#create" do
    let(:params) do
      {
        favourite_album: {
          collection_id: 1001,
          thumbnail: 'http://url.com.br',
          title: 'title',
          subtitle: 'subtitle'
        }
      }
    end

    it 'returns status 200' do
      post :create, params: params

      expect(response.status).to eq(200)
    end
    it 'returns status 422' do
      params[:favourite_album][:collection_id] = favourite_album.collection_id
      post :create, params: params

      expect(response.status).to eq(422)
    end
  end

  context "DELETE favourite_albums#destroy" do
    it 'returns status 200' do
      delete :destroy, params: { id: favourite_album.collection_id }

      expect(response.status).to eq(200)
    end
    it 'returns status 404' do
      delete :destroy, params: { id: 1001 }

      expect(response.status).to eq(404)
    end
  end
end
