# == Schema Information
#
# Table name: countries
#
#  id              :integer          not null, primary key
#  code            :text
#  name            :text
#  continent       :text
#  region          :text
#  surface_area    :float
#  indep_year      :integer
#  population      :integer
#  life_expectancy :float
#  gnp             :float
#  gnp_old         :float
#  local_name      :text
#  government_form :text
#  head_of_state   :text
#  capital         :integer
#  code_2          :text
#  created_at      :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#  updated_at      :datetime         default(Sat, 24 Sep 2016 14:57:52 UTC +00:00)
#

class CountrySerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :continent, :region, :surface_area, :indep_year, :population, :life_expectancy, :gnp, :gnp_old, :local_name, :government_form, :head_of_state, :capital, :code_2
end
