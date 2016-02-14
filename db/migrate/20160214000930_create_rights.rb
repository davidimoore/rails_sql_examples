class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.text :description

      t.timestamps default: DateTime.now
    end
  end
end
