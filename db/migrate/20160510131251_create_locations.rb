class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.boolean :billable
      t.integer :region_id
      t.timestamps null: false
    end
  end
end
