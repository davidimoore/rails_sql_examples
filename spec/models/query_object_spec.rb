require 'rails_helper'
describe QueryObject do
  context '#select_all_statement' do
    it 'returns all instances of a class' do
      albums = ['album-1', 'album-2'].map {|album_title| create(:album, title:album_title)}
      expect(QueryObject.new.select_all_statement(Album)).to match(albums)

    end
  end
end