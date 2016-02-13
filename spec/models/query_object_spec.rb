require 'rails_helper'
describe QueryObject do
  context '#ar_query' do
    it 'sends the find_by_sql method to its query_target' do
      query_target = double('query_target')
      sql = 'FIND STUFF'
      allow(query_target).to receive(:find_by_sql).with(sql)
      QueryObject.new(query_target).ar_query(sql)
      expect(query_target).to have_received(:find_by_sql).with(sql)
    end
  end

  context 'SELECT *' do
    it 'returns all instances of a class' do
      albums = ['album-1', 'album-2'].map {|album_title| create(:album, title:album_title)}
      query = "SELECT * FROM albums"
      expect(QueryObject.new(Album).ar_query(query)).to match_array(albums)
    end
  end

  context 'SELECT ALL, ORDER BY' do
    it 'returns an array of objects ordered by a column' do
      album_1 = create(:album, title:'album 1')
      album_2 = create(:album, title:'album 2')
      query = "SELECT * FROM albums ORDER BY title"
      expect(QueryObject.new(Album).ar_query(query)).to eq([album_1, album_2])
      expect(QueryObject.new(Album).ar_query(query)).to_not eq([album_2, album_1])
    end
  end

  context 'SELECT COLUMNS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:netherlands) {create(:netherlands)}

    it 'returns a result set of column values' do
      query = "SELECT name, life_expectancy FROM countries"
      expect(QueryObject.new(Country).sql_query(query)).to match(["Afghanistan", "45.9", "Netherlands", "78.3"] )
    end
  end

  context 'SELECT ROWS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:netherlands) {create(:netherlands)}
    it 'returns a set of rows filtered by a where clause' do
      query = "SELECT name, continent, region FROM countries WHERE continent = 'Asia'"
      expect(QueryObject.new(Country).sql_query(query)).to match(["Afghanistan", "Asia", "Southern and Central Asia"]  )

    end
  end

  context 'SELECT AND LIMIT ROWS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:china) { create(:china)}
    let!(:netherlands) {create(:netherlands)}
    it 'returns a set of rows filtered by a where clause' do
      query = "SELECT name, continent, region FROM countries WHERE continent = 'Asia' LIMIT 1"
      expect(QueryObject.new(Country).sql_query(query)).to match(["Afghanistan", "Asia", "Southern and Central Asia"])

    end
  end

  context 'COUNTING ROWS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:china) { create(:china)}
    let!(:netherlands) {create(:netherlands)}
    it 'counts the number of rows matching a search criteria' do
      query = "SELECT COUNT(*) FROM countries WHERE continent = 'Asia'"
      expect(QueryObject.new(Country).sql_query(query)[0]).to eq("2")


    end
  end


end