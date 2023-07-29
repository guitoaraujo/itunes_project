require 'rails_helper'

describe FavouriteAlbumsHandler do
  subject { described_class.new(results).call }

  context "#call" do
    context "when there are not favourite albums" do
      let!(:results) do
        [
          {
            collection_id: 1001,
            thumbnail: 'http://url.com.br',
            title: 'title',
            subtitle: 'subtitle',
            favourite: false
          }
        ]
      end

      it 'returns only results received' do
        expect(subject).to eq(results)
      end
    end
    context "when there are favourite albums" do
      let!(:favourite_album) { create(:favourite_album) }
      let!(:results) do
        [
          {
            collection_id: favourite_album.collection_id,
            thumbnail: 'http://url.com.br',
            title: 'title',
            subtitle: 'subtitle',
            favourite: false
          }
        ]
      end

      it 'changes results favourite attributes to true and returns results' do
        expect(subject).to eq(results)
      end
    end
  end
end
