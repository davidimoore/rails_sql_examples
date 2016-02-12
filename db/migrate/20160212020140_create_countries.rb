class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.text :code
      t.text :name
      t.text :continent
      t.text :region
      t.float :surface_area
      t.integer :indep_year
      t.integer :population
      t.float :life_expectancy
      t.float :gnp
      t.float :gnp_old
      t.text :local_name
      t.text :government_form
      t.text :head_of_state
      t.integer :capital
      t.text :code_2

      t.timestamps
    end
  end
end
