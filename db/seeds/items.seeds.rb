sql =
    "INSERT INTO items ( id, name, description ) VALUES ( 1, 'Box of 64 Pixels', '64 RGB pixels in a decorative box' );
    INSERT INTO items ( id, name, description ) VALUES ( 2, 'Sense of Humor', 'Especially dry. Imported from England.' );
    INSERT INTO items ( id, name, description ) VALUES ( 3, 'Beauty', 'Inner beauty. No cosmetic surgery required!' );
    INSERT INTO items ( id, name, description ) VALUES ( 4, 'Bar Code', 'Unused. In original packaging.' );"
ActiveRecord::Base.connection.execute sql