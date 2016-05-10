sql =
    "INSERT INTO lefts VALUES ( 1, 'left 01' );
INSERT INTO lefts VALUES ( 2, 'left 02' );
INSERT INTO lefts VALUES ( 3, 'left 03' );
INSERT INTO lefts VALUES ( 4, 'left 04' );
INSERT INTO lefts VALUES ( 5, 'left 05' );
INSERT INTO lefts VALUES ( 6, 'left 06' );
INSERT INTO lefts VALUES ( 7, 'left 07' );
INSERT INTO lefts VALUES ( 8, 'left 08' );
INSERT INTO lefts VALUES ( 9, 'left 09' );

INSERT INTO rights VALUES ( 6, 'right 06' );
INSERT INTO rights VALUES ( 7, 'right 07' );
INSERT INTO rights VALUES ( 8, 'right 08' );
INSERT INTO rights VALUES ( 9, 'right 09' );
INSERT INTO rights VALUES ( 10, 'right 10' );
INSERT INTO rights VALUES ( 11, 'right 11' );
INSERT INTO rights VALUES ( 12, 'right 12' );
INSERT INTO rights VALUES ( 13, 'right 13' );
INSERT INTO rights VALUES ( 14, 'right 14' );"
ActiveRecord::Base.connection.execute sql