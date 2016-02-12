require 'rails_helper'

RSpec.describe "CountryLanguages", type: :request do
  describe "GET /country_languages" do
    it "works! (now write some real specs)" do
      get country_languages_path
      expect(response).to have_http_status(200)
    end
  end
end
