sql = "BEGIN;
INSERT INTO customers ( id, name, address, city, state, zip ) VALUES ( 1, 'Bill Smith', '123 Main Street', 'Hope', 'CA', '98765' );
INSERT INTO customers ( id, name, address, city, state, zip ) VALUES ( 2, 'Mary Smith', '123 Dorian Street', 'Harmony', 'AZ', '98765' );
INSERT INTO customers ( id, name, address, city, state, zip ) VALUES ( 3, 'Bob Smith', '123 Laugh Street', 'Humor', 'CA', '98765' );
COMMIT;"
ActiveRecord::Base.connection.execute sql