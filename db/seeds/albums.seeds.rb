sql =
    "INSERT INTO albums (id, title, artist, label, released) VALUES (1,'Two Men with the Blues','Willie Nelson and Wynton Marsalis','Blue Note','2008-07-08');
INSERT INTO albums (id, title, artist, label, released) VALUES (11,'Hendrix in the West','Jimi Hendrix','Polydor','1972-01-00');
INSERT INTO albums (id, title, artist, label, released) VALUES (12,'Rubber Soul','The Beatles','Parlophone','1965-12-03');
INSERT INTO albums (id, title, artist, label, released) VALUES (13,'Birds of Fire','Mahavishnu Orchestra','Columbia','1973-03-00');
INSERT INTO albums (id, title, artist, label, released) VALUES (16,'Live And','Johnny Winter','Columbia','1971-05-00');
INSERT INTO albums (id, title, artist, label, released) VALUES (17,'Apostrophe','Frank Zappa','DiscReet','1974-04-22');
INSERT INTO albums (id, title, artist, label, released) VALUES (18,'Kind of Blue','Miles Davis','Columbia','1959-08-17');"

ActiveRecord::Base.connection.execute sql