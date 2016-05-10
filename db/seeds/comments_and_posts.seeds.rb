new_posts_insert =
    "INSERT INTO posts VALUES (1, 'foo');
   INSERT INTO posts VALUES (2, 'bar');"

comments_for_first_post_insert =
    "INSERT INTO comments VALUES (1, 1, 'foo old');
  INSERT INTO comments VALUES (2, 1, 'foo new');
  INSERT INTO comments VALUES (3, 1, 'foo newer');
  INSERT INTO comments VALUES (4, 1, 'foo newest');"

comments_for_second_post_insert =
    "INSERT INTO comments VALUES (5, 2, 'bar old');
  INSERT INTO comments VALUES (6, 2, 'bar new');
  INSERT INTO comments VALUES (7, 2, 'bar newer');
  INSERT INTO comments VALUES (8, 2, 'bar newest');"

[new_posts_insert, comments_for_first_post_insert, comments_for_second_post_insert].each do |insert_statement|
  ActiveRecord::Base.connection.execute insert_statement
end