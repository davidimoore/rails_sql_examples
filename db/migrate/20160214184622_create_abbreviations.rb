class CreateAbbreviations < ActiveRecord::Migration
  def change
    create_table :abbreviations do |t|
      t.text :first
      t.text :second

      t.timestamps default: DateTime.now
    end
  end
end
