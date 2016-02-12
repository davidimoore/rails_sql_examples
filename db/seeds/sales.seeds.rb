sql =
  "INSERT INTO sales ( id, item_id, customer_id, date, quantity, price ) VALUES ( 1, 1, 2, '2009-02-27', 3, 2995 );
  INSERT INTO sales ( id, item_id, customer_id, date, quantity, price ) VALUES ( 2, 2, 2, '2009-02-27', 1, 1995 );
  INSERT INTO sales ( id, item_id, customer_id, date, quantity, price ) VALUES ( 3, 1, 1, '2009-02-28', 1, 2995 );
  INSERT INTO sales ( id, item_id, customer_id, date, quantity, price ) VALUES ( 4, 4, 3, '2009-02-28', 2, 999 );
  INSERT INTO sales ( id, item_id, customer_id, date, quantity, price ) VALUES ( 5, 1, 2, '2009-02-28', 1, 2995 );"
ActiveRecord::Base.connection.execute sql