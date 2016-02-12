class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :body

      t.timestamps default: DateTime.now
    end
  end
end
