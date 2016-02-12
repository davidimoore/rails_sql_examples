class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :label, :released
end
