class CreateBoolTests < ActiveRecord::Migration
  def change
    create_table :bool_tests do |t|
      t.integer :a
      t.integer :b

      t.timestamps default: DateTime.now
    end
  end
end
