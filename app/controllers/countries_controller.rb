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

class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy]

  # GET /countries
  # GET /countries.json
  def index
    @countries = Country.all

    render json: @countries
  end

  # GET /countries/1
  # GET /countries/1.json
  def show
    render json: @country
  end

  # POST /countries
  # POST /countries.json
  def create
    @country = Country.new(country_params)

    if @country.save
      render json: @country, status: :created, location: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /countries/1
  # PATCH/PUT /countries/1.json
  def update
    @country = Country.find(params[:id])

    if @country.update(country_params)
      head :no_content
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # DELETE /countries/1
  # DELETE /countries/1.json
  def destroy
    @country.destroy

    head :no_content
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:code, :name, :continent, :region, :surface_area, :indep_year, :population, :life_expectancy, :gnp, :gnp_old, :local_name, :government_form, :head_of_state, :capital, :code_2)
  end
end
