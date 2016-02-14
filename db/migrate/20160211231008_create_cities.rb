class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.text :name
      t.text :country_code
      t.text :district
      t.text :population

      t.timestamps default: DateTime.now
    end
  end
end
