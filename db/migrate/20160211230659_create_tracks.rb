class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.text :title
      t.integer :track_number
      t.integer :duration

      t.timestamps default: DateTime.now
    end
  end
end
