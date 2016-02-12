class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :country_code, :district, :population
end
