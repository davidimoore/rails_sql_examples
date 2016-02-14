require 'rails_helper'
describe JoinQueryObject do


  context 'INNER JOIN' do
    before  do
      create(:left,  id:1, description: "left 01")
      create(:left,  id:2, description: "left 01")
      create(:right, id:1, description: "right 01")
    end

    it 'returns a result that includes only non NULL values' do
      query = "SELECT lefts.description, rights.description "
      query +=  "FROM lefts "
      query +=  "JOIN rights "
      query +=    "ON lefts.id = rights.id "
      expect(JoinQueryObject.new.sql_query(query))
      .to match(["left 01", "right 01"])
    end
  end

  context 'LEFT JOIN' do
    before  do
      create(:left,  id:1, description: "left 01")
      create(:left,  id:2, description: "left 02")
      create(:right, id:1, description: "right 01")
    end

    it 'returns a result that includes NULL values' do
      query = "SELECT lefts.description, rights.description "
      query +=  "FROM lefts "
      query +=  "LEFT JOIN rights "
      query +=    "ON lefts.id = rights.id "
      expect(JoinQueryObject.new.sql_query(query))
      .to match(["left 01", "right 01", "left 02", nil])
    end
  end

  context 'MULTIPE RELATED TABLES' do
    before do
      create(:item, id:1, name: 'Box of 64 Pixels', description: '64 RGB pixels in a decorative box')
      create(:item, id:2, name: 'Sense of Humor', description:'Especially dry. Imported from England.')
      create(:item, id:3, name: 'Beauty', description: 'Inner beauty. No cosmetic surgery required!')
      create(:item, id:4, name: 'Bar Code', description: 'Unused. In original packaging.')

      create(:customer, id:1, name: 'Bill Smith', address:'123 Main Street',city: 'Hope',state:'CA',zip:'98765')
      create(:customer, id:2, name: 'Mary Smith', address:'123 Dorian Street',city: 'Harmony',state:'AZ',zip:'98765')
      create(:customer, id:3, name: 'Bob Smith', address:'123 Laugh Street',city: 'Humor',state:'AZ',zip:'98765')

      create(:sale, id:1, item_id:1, customer_id:2, date:'2009-02-27', quantity:3, price:2995)
      create(:sale, id:2, item_id:2, customer_id:2, date:'2009-02-27', quantity:1, price:1995)
      create(:sale, id:3, item_id:1, customer_id:1, date:'2009-02-28', quantity:1, price:2995)
      create(:sale, id:4, item_id:4, customer_id:3, date:'2009-02-28', quantity:2, price:999)
      create(:sale, id:5, item_id:1, customer_id:2, date:'2009-02-28', quantity:3, price:2995)

    end

    it 'enables multiple joins' do
      query = "SELECT customers.name, items.name, sales.price "
      query += "FROM customers "
      query += "JOIN sales ON sales.customer_id = customers.id "
      query += "JOIN items ON sales.item_id = items.id "
      query += "ORDER BY customers.name, items.name "

      expect(JoinQueryObject.new.sql_query(query))
      .to match( ["Bill Smith", "Box of 64 Pixels", "2995",
                  "Bob Smith", "Bar Code", "999",
                  "Mary Smith", "Box of 64 Pixels", "2995",
                  "Mary Smith", "Box of 64 Pixels", "2995",
                  "Mary Smith", "Sense of Humor", "1995"] )
    end



  end


end