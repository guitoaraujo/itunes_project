# frozen_string_literal: true

require 'rails_helper'

describe FavouriteAlbum, type: :model do
  subject { described_class.new(params) }
  let(:favourite_album) { create(:favourite_album) }
  let(:params) do
    {
      collection_id: 1001,
      thumbnail: 'http://url.com.br',
      title: 'title',
      subtitle: 'subtitle'
    }
  end

  context 'attributes present' do
    it 'is valid with required attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without any required attributes' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end

  context 'attributes uniq' do
    it 'is valid with collection_id unique' do
      expect(subject).to be_valid
    end
    it 'is not valid with collection_id not unique' do
      subject.collection_id = favourite_album.collection_id
      expect(subject).to_not be_valid
    end
  end
end
