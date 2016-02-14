class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :item_id
      t.integer :customer_id
      t.date :date
      t.integer :quantity
      t.integer :price

      t.timestamps default: DateTime.now
    end
  end
end
