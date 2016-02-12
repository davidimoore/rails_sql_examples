require "rails_helper"

RSpec.describe CountryLanguagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/country_languages").to route_to("country_languages#index")
    end

    it "routes to #new" do
      expect(:get => "/country_languages/new").to route_to("country_languages#new")
    end

    it "routes to #show" do
      expect(:get => "/country_languages/1").to route_to("country_languages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/country_languages/1/edit").to route_to("country_languages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/country_languages").to route_to("country_languages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/country_languages/1").to route_to("country_languages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/country_languages/1").to route_to("country_languages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/country_languages/1").to route_to("country_languages#destroy", :id => "1")
    end

  end
end