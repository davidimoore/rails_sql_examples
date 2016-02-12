require 'rails_helper'
describe QueryObject do
  context '#select_all_statement' do
    it 'returns all instances of a class' do
      albums = ['album-1', 'album-2'].map {|album_title| create(:album, title:album_title)}
      expect(QueryObject.new(Album).select_all).to match_array(albums)
    end
  end

  context '#select_all_order_by' do
    it 'returns an array of objects ordered by a column' do
      album_1 = create(:album, title:'album 1')
      album_2 = create(:album, title:'album 2')
      expect(QueryObject.new(Album).select_all_order_by('title')).to eq([album_1, album_2])
      expect(QueryObject.new(Album).select_all_order_by('title')).to_not eq([album_2, album_1])
    end
  end

  context '#select_columns' do
    before(:all) do
      [:afganistan, :netherlands].each  {|country| create(country)}
    end
    it 'returns a result set of column values' do
      plucked_results = Country.pluck(:name, :life_expectancy)
      expect(QueryObject.new(Country).select_columns(:name, :life_expectancy))
      .to match plucked_results
    end
  end
end