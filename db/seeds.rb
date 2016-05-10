["albums", "cities", "countries", "country_languages", "customers", "items", "sales", "tracks"].each do |table|
  ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end