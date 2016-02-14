require 'rails_helper'
describe SubselectsQueryObject do
  context 'SIMPLE SUBSELECT' do
    before do
      [:united_states, :united_kingdom, :france].each do |c|
        create(c)
      end

      [['NY0123', 'US456'],
       ['AZ9437', 'GB1234'],
       ['CA1279', 'FR5678']
      ].each do |pair|
        create(:abbreviation, first:pair[0], second:pair[1])
      end
    end
      it 'can perform a subselect with substrings' do
        sub_query = 'SELECT SUBSTR(first, 1, 2) AS state, SUBSTR(first, 3) AS state_code, '
        sub_query += 'SUBSTR(second, 1, 2) AS country, SUBSTR(second, 3) AS country_code '
        sub_query += 'FROM abbreviations '

        query =  "SELECT country.name, subselect.country_code "
        query +=  "FROM ( #{sub_query} ) AS subselect "
        query +=  "JOIN countries AS country "
        query +=  "ON country.code_2 = subselect.country"


        expect(SubselectsQueryObject.new.execute(query))
        .to match([["United States", "456"], ["United Kingdom", "1234"], ["France", "5678"]])
      end

  end

  context 'SEARCH SUBSELECT RESULTS' do
    before do
      create(:album, id:1, title:'Two Men with the Blues',artist:'Willie Nelson and Wynton Marsalis', label:'Blue Note', released:'2008-07-08')
      create(:album, id:11, title:'Hendrix in the West',artist:'Jimi Hendrix', label:'Polydor', released:'1972-01-00')
      create(:album, id:12, title:'Rubber Soul',artist:'The Beatles', label:'Parlophone', released:'1965-12-03')
      create(:album, id:13, title:'Birds of Fire', artist:'Mahavishnu Orchestra', label:'Columbia', released:'1971-05-00')
      create(:album, id:16, title:'Live And',artist:'Johnny Winter', label:'Columbia', released:'1971-05-00')
      create(:album, id:17, title:'Apostrophe',artist:'Frank Zappa', label:'DiscReet', released:'1974-04-22')
      create(:album, id:18, title:'Kind of Blue',artist:'Miles Davis', label:'Columbia', released:'1959-08-17')

      album_tracks_data.each do |track_details|
        create(:track,
               id:track_details[0],
               album_id:track_details[1],
               title:track_details[2],
               track_number:track_details[3],
               duration:track_details[4]
        )
      end
    end

    it 'searches through a result set and returns excessive data' do
      sub_query = "SELECT DISTINCT album_id FROM tracks WHERE duration <= 90"
      query = "SELECT albums.title,albums.artist, tracks.duration "
      query += "FROM albums "
      query += "JOIN tracks ON tracks.album_id = albums.id "
      query += "WHERE albums.id IN (#{sub_query}) "
      query += "ORDER BY albums.title, tracks.track_number, albums.id "

      expect(SubselectsQueryObject.new.execute(query))
      .to match([["Birds of Fire", "Mahavishnu Orchestra", "350"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "287"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "174"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "24"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "203"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "119"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "597"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "305"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "236"],
                 ["Birds of Fire", "Mahavishnu Orchestra", "129"],
                 ["Hendrix in the West", "Jimi Hendrix", "285"],
                 ["Hendrix in the West", "Jimi Hendrix", "185"],
                 ["Hendrix in the West", "Jimi Hendrix", "266"],
                 ["Hendrix in the West", "Jimi Hendrix", "469"],
                 ["Hendrix in the West", "Jimi Hendrix", "160"],
                 ["Hendrix in the West", "Jimi Hendrix", "76"],
                 ["Hendrix in the West", "Jimi Hendrix", "194"],
                 ["Hendrix in the West", "Jimi Hendrix", "786"],
                 ["Hendrix in the West", "Jimi Hendrix", "549"]]  )
    end

    it 'searches through the results of a subselect' do
      join_sub_query = "SELECT album_id, track_number, duration, title "
      join_sub_query += "FROM tracks "
      join_sub_query += "WHERE duration <= 90 "

      query = "SELECT albums.title, albums.artist, short_tracks.duration "
      query += "FROM albums "
      query += "JOIN (#{join_sub_query}) as short_tracks ON short_tracks.album_id = albums.id  "
      query += "ORDER BY albums.title, short_tracks.track_number "


      expect(SubselectsQueryObject.new.execute(query))
          .to match([
                        ["Birds of Fire", "Mahavishnu Orchestra", "24"],
                        ["Hendrix in the West", "Jimi Hendrix", "76"]
                    ]
              )
    end
  end
end
