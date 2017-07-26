# == Schema Information
#
# Table name: cities
#
#  id           :integer          not null, primary key
#  name         :text
#  country_code :text
#  district     :text
#  population   :text
#  created_at   :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at   :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class CitySerializer < ActiveModel::Serializer
  attributes :id, :name, :country_code, :district, :population
end
