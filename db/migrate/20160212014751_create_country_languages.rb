class CreateCountryLanguages < ActiveRecord::Migration
  def change
    create_table :country_languages do |t|
      t.text :country_code
      t.text :language
      t.integer :is_official
      t.float :percentage

      t.timestamps
    end
  end
end
