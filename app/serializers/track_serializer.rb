class TrackSerializer < ActiveModel::Serializer
  attributes :id, :album_id, :title, :track_number, :duration
end
