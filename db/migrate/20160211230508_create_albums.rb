class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :title
      t.text :artist
      t.text :label
      t.text :released

      t.timestamps default: DateTime.now
    end
  end
end
