require 'rails_helper'
describe QueryObject do
  context '#ar_query' do
    it 'sends the find_by_sql method to its query_target' do
      query_target = double('query_target')
      sql = 'FIND STUFF'
      allow(query_target).to receive(:find_by_sql).with(sql)
      QueryObject.new(query_target).ar_query(sql)
      expect(query_target)
      .to have_received(:find_by_sql).with(sql)
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
      expect(QueryObject.new(Album).ar_query(query))
      .to eq([album_1, album_2])
      expect(QueryObject.new(Album).ar_query(query))
      .to_not eq([album_2, album_1])
    end
  end

  context 'SELECT COLUMNS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:netherlands) {create(:netherlands)}

    it 'returns a result set of column values' do
      query = "SELECT name, life_expectancy FROM countries"
      expect(QueryObject.new(Country).sql_query(query))
      .to match(["Afghanistan", "45.9", "Netherlands", "78.3"] )
    end
  end

  context 'SELECT ROWS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:netherlands) {create(:netherlands)}
    it 'returns a set of rows filtered by a where clause' do
      query = "SELECT name, continent, region FROM countries WHERE continent = 'Asia'"
      expect(QueryObject.new(Country).sql_query(query))
      .to match(["Afghanistan", "Asia", "Southern and Central Asia"]  )

    end
  end

  context 'SELECT AND LIMIT ROWS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:china) { create(:china)}
    let!(:netherlands) {create(:netherlands)}
    it 'returns a set of rows filtered by a where clause' do
      query = "SELECT name, continent, region FROM countries WHERE continent = 'Asia' LIMIT 1"
      expect(QueryObject.new(Country).sql_query(query))
      .to match(["Afghanistan", "Asia", "Southern and Central Asia"])

    end
  end

  context 'COUNTING ROWS' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:china) { create(:china)}
    let!(:netherlands) {create(:netherlands)}
    it 'counts the number of rows matching a search criteria' do
      query = "SELECT COUNT(*) FROM countries WHERE continent = 'Asia'"
      expect(QueryObject.new(Country).sql_query(query)[0])
      .to eq("2")
    end
  end

  context 'FILTERING DATA WITH LIKE and ILIKE and IN' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:china) { create(:china)}
    let!(:netherlands) {create(:netherlands)}
    let!(:antarctica) { create(:antarctica)}
    let!(:french_guiana) {create(:french_guiana)}
    let!(:french_polynesia) {create(:french_polynesia)}

    it 'selects rows matching complex criterian' do
      query = "SELECT name, continent, population "
      query += "FROM countries "
      query += "WHERE continent = 'Asia' "
      query += "AND population IS NOT NULL "
      query += "ORDER BY population DESC"

      expect(QueryObject.new(Country).sql_query(query))
      .to match(["China", "Asia", "1277558000", "Afghanistan", "Asia", "22720000"])

    end
    it 'selects rows when the criteria includes an AND statement' do
      query = "SELECT name, continent, population "
      query += "FROM countries "
      query += "WHERE population < 1000000000 "
      query += "AND continent = 'Asia' "
      expect(QueryObject.new(Country).sql_query(query))
      .to match(["Afghanistan", "Asia", "22720000"] )
    end

    it 'selects rows when the criteria inclues a wildcard LIKE statement' do
      query = "SELECT name, continent, population "
      query += "FROM countries "
      query += "WHERE name LIKE '%French%' "
      expect(QueryObject.new(Country).sql_query(query))
      .to match(["French Guiana", "South America", "181000", "French Polynesia", "Oceania", "235000"] )
    end

    it 'selects rows when the criteria includes a wildcard ILIKE statement' do
      query = "SELECT name, continent, population "
      query += "FROM countries "
      query += "WHERE name ILIKE '%french%' "
      expect(QueryObject.new(Country).sql_query(query))
          .to match(["French Guiana", "South America", "181000", "French Polynesia", "Oceania", "235000"] )
    end

    it 'selects rows when the criteria includes an IN statement' do
      query = "SELECT name "
      query += "FROM countries "
      query += "WHERE continent IN ('Asia', 'South America') "
      expect(QueryObject.new(Country).sql_query(query))
          .to match( ["Afghanistan", "China", "French Guiana"] )
    end
  end

  context 'FILTERING DISTINCT DATA' do
    let!(:afghanistan) { create(:afghanistan)}
    let!(:china) { create(:china)}
    let!(:netherlands) {create(:netherlands)}
    let!(:antarctica) { create(:antarctica)}
    let!(:french_guiana) {create(:french_guiana)}
    let!(:french_polynesia) {create(:french_polynesia)}
    it 'returns unique results' do
      indistinct_query = "SELECT continent "
      indistinct_query += "FROM countries "

      expect(QueryObject.new(Country).sql_query(indistinct_query))
      .to match( ["Asia", "Asia", "Europe", "Antarctica", "South America", "Oceania"] )

      distinct_query = "SELECT DISTINCT continent "
      distinct_query += "FROM countries "

      expect(QueryObject.new(Country).sql_query(distinct_query))
      .to match_array( ["Asia", "Europe", "Antarctica", "South America", "Oceania"] )
    end

    it 'returns unique results for multiple columns' do
      [[1,1],[3,1],[1,2]].each do |scores|
        create(:two_player_score, player_1:scores[0], player_2:scores[1])
      end

      query = "SELECT DISTINCT player_1, player_2 "
      query += "FROM two_player_scores"

      expect(QueryObject.new(TwoPlayerScore).connection.execute(query).values)
      .to match_array( [["1", "1"], ["1", "2"], ["3", "1"]])
    end
  end

  context 'SORTING WITH ORDER BY' do
    before do
      [:afghanistan, :china, :el_salvador, :french_guiana, :france, :netherlands].each {|country| create(country)}
    end

    it 'returns results ordered by a column' do
      query = "SELECT name FROM countries "
      query += "ORDER BY name"
      expect(QueryObject.new(Country).sql_query(query))
     .to match(["Afghanistan", "China", "El Salvador","France", "French Guiana", "Netherlands"])
    end

    it 'returns results in reverse order by column' do
      query = "SELECT name FROM countries "
      query += "ORDER BY name DESC"
      expect(QueryObject.new(Country).sql_query(query))
          .to match(["Netherlands", "French Guiana", "France", "El Salvador", "China", "Afghanistan"])
    end

    it 'returns results sorted by multiple columns' do
      query = "SELECT name, continent "
      query += "FROM countries "
      query += "ORDER BY continent, name"
      expect(QueryObject.new(Country).connection.execute(query).values)
      .to match([["Afghanistan", "Asia"], ["China", "Asia"],
                 ["France", "Europe"], ["Netherlands", "Europe"],
                 ["El Salvador", "North America"],
                 ["French Guiana", "South America"]])
    end

    it 'returns results sorted by two columns ascending and one column descending' do
      query = "SELECT name, continent, region "
      query += "FROM countries "
      query += "ORDER BY continent DESC, region, name"
      expect(QueryObject.new(Country).connection.execute(query).values)
          .to match([["French Guiana", "South America", "South America"],
                     ["El Salvador", "North America", "Central America"],
                     ["France", "Europe", "Western Europe"], ["Netherlands", "Europe", "Western Europe"],
                     ["China", "Asia", "Eastern Asia"], ["Afghanistan", "Asia", "Southern and Central Asia"]]  )
    end


  end

  context 'CONDITIONAL EXPRESSIONS WITH CASE' do
    before do
      create(:bool_test, a:1, b:0)
    end
    it 'returns results based on a case statement' do
      query = "SELECT a,b, "
        query += "CASE a WHEN 1 THEN 'true' ELSE 'false' END as boolA, "
        query += "CASE b WHEN 1 THEN 'true' ELSE 'false' END as boolB "
      query += "FROM bool_tests"
      expect(QueryObject.new(BoolTest).sql_query(query))
      .to match( ["1", "0", "true", "false"]  )
    end
  end

end