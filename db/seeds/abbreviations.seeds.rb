sql = "INSERT INTO abbreviations VALUES (1, 'NY0123', 'US4567' );
INSERT INTO abbreviations VALUES ( 2, 'AZ9437', 'GB1234' );
INSERT INTO abbreviations VALUES ( 3, 'CA1279', 'FR5678' );"
ActiveRecord::Base.connection.execute sql