class CountrySerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :continent, :region, :surface_area, :indep_year, :population, :life_expectancy, :gnp, :gnp_old, :local_name, :government_form, :head_of_state, :capital, :code_2
end
