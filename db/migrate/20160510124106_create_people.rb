class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.integer :role_id
      t.integer :location_id
      t.integer :manager_id

      t.timestamps null: false
    end
  end
end
