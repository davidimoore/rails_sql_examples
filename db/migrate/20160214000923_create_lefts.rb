class CreateLefts < ActiveRecord::Migration
  def change
    create_table :lefts do |t|
      t.text :description

      t.timestamps default: DateTime.now
    end
  end
end
