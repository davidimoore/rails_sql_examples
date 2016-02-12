class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.text :name
      t.text :address
      t.text :city
      t.text :state
      t.text :zip

      t.timestamps
    end
  end
end
