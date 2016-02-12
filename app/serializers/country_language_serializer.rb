class CountryLanguageSerializer < ActiveModel::Serializer
  attributes :id, :country_code, :is_official, :percentage
end
