class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.string :body

      t.timestamps default: DateTime.now
    end
  end
end
