require 'rails_helper'
describe 'Aggregate Queries' do

  context 'Count' do
    before do
      create(:album, id: 1, title: 'Two Men with the Blues', artist: 'Willie Nelson and Wynton Marsalis', label: 'Blue Note', released: '2008-07-08')
      create(:album, id: 11, title: 'Hendrix in the West', artist: 'Jimi Hendrix', label: 'Polydor', released: '1972-01-00')
      create(:album, id: 12, title: 'Rubber Soul', artist: 'The Beatles', label: 'Parlophone', released: '1965-12-03')
      create(:album, id: 13, title: 'Birds of Fire', artist: 'Mahavishnu Orchestra', label: 'Columbia', released: '1971-05-00')
      create(:album, id: 16, title: 'Live And', artist: 'Johnny Winter', label: 'Columbia', released: '1971-05-00')
      create(:album, id: 17, title: 'Apostrophe', artist: 'Frank Zappa', label: 'DiscReet', released: '1974-04-22')
      create(:album, id: 18, title: 'Kind of Blue', artist: 'Miles Davis', label: 'Columbia', released: '1959-08-17')

      album_tracks_data.each do |track_details|
        create(:track,
               id: track_details[0],
               album_id: track_details[1],
               title: track_details[2],
               track_number: track_details[3],
               duration: track_details[4]
        )
      end
    end

    it 'returns results aggregated and grouped based on a COUNT function' do
      query = "SELECT albums.title, COUNT(tracks.track_number) as Tracks "
      query += "FROM tracks "
      query += "JOIN albums ON albums.id = tracks.album_id "
      query += "GROUP BY albums.id "
      query += "ORDER BY Tracks DESC, albums.title"

      expect(AggregateQueryObject.new.connection.execute(query).values)
          .to match([["Rubber Soul", "14"],
                     ["Birds of Fire", "10"],
                     ["Two Men with the Blues", "10"],
                     ["Apostrophe", "9"],
                     ["Hendrix in the West", "9"],
                     ["Live And", "6"],
                     ["Kind of Blue", "5"]]
              )
    end

    it 'returns results aggregated and grouped based on a COUNT function combined with a HAVING clause' do
      query = "SELECT albums.title, COUNT(tracks.track_number) as Tracks "
      query += "FROM tracks "
      query += "JOIN albums ON albums.id = tracks.album_id "
      query += "GROUP BY albums.id "
      query += "HAVING COUNT(tracks.track_number) >= 10 "
      query += "ORDER BY Tracks DESC, albums.title"

      expect(AggregateQueryObject.new.connection.execute(query).values)
          .to match([["Rubber Soul", "14"],
                     ["Birds of Fire", "10"],
                     ["Two Men with the Blues", "10"]]
              )
    end

    it 'returns results aggregated and grouped based on a COUNT function and filtered further' do
      query = "SELECT albums.title, COUNT(tracks.track_number) as Tracks "
      query += "FROM tracks "
      query += "JOIN albums ON albums.id = tracks.album_id "
      query += "WHERE albums.artist = 'The Beatles'"
      query += "GROUP BY albums.id "
      query += "ORDER BY Tracks DESC, albums.title"

      expect(AggregateQueryObject.new.connection.execute(query).values)
          .to match([["Rubber Soul", "14"]])
    end

  end

  context 'AGGREGATE FUNCTIONS' do
    let!(:france) { create(:france) }
    let!(:netherlands) { create(:netherlands) }


    it 'returns results that are averaged and grouped' do
      query = "SELECT region, AVG(population) "
      query += "FROM countries "
      query += "GROUP BY region "
      expect(AggregateQueryObject.new.execute(query))
          .to match([["Western Europe", "37544850.000000000000"]])
    end

    it 'returns results that are summed and grouped' do
      query = "SELECT region, SUM(population) "
      query += "FROM countries "
      query += "GROUP BY region "
      expect(AggregateQueryObject.new.execute(query))
          .to match([["Western Europe", "75089700"]])
    end
  end

  context 'AGGREGATE DISTINCT VALUES' do
    before do
      [:china, :france, :netherlands].each do |c|
        create(c)
      end
    end

    it 'returns unique aggregated results' do
      indistinct_query = "SELECT count(region) "
      indistinct_query += "FROM countries "

      expect(AggregateQueryObject.new.execute(indistinct_query))
          .to match([["3"]])

      indistinct_query = "SELECT COUNT(DISTINCT region) "
      indistinct_query += "FROM countries "

      expect(AggregateQueryObject.new.execute(indistinct_query))
          .to match([["2"]])
    end

  end

end
