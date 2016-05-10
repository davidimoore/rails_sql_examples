# == Schema Information
#
# Table name: country_languages
#
#  id           :integer          not null, primary key
#  country_code :text
#  language     :text
#  is_official  :integer
#  percentage   :float
#  created_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#  updated_at   :datetime         default(Tue, 10 May 2016 13:42:38 UTC +00:00)
#

class CountryLanguagesController < ApplicationController
  before_action :set_country_language, only: [:show, :update, :destroy]

  # GET /country_languages
  # GET /country_languages.json
  def index
    @country_languages = CountryLanguage.all

    render json: @country_languages
  end

  # GET /country_languages/1
  # GET /country_languages/1.json
  def show
    render json: @country_language
  end

  # POST /country_languages
  # POST /country_languages.json
  def create
    @country_language = CountryLanguage.new(country_language_params)

    if @country_language.save
      render json: @country_language, status: :created, location: @country_language
    else
      render json: @country_language.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /country_languages/1
  # PATCH/PUT /country_languages/1.json
  def update
    @country_language = CountryLanguage.find(params[:id])

    if @country_language.update(country_language_params)
      head :no_content
    else
      render json: @country_language.errors, status: :unprocessable_entity
    end
  end

  # DELETE /country_languages/1
  # DELETE /country_languages/1.json
  def destroy
    @country_language.destroy

    head :no_content
  end

  private

  def set_country_language
    @country_language = CountryLanguage.find(params[:id])
  end

  def country_language_params
    params.require(:country_language).permit(:country_code, :is_official, :percentage)
  end
end
