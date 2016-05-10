class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :billable

      t.timestamps null: false
    end
  end
end
