require "spec_helper"

describe SportKeywordsController do
  describe "routing" do

    it "routes to #index" do
      get("/sport_keywords").should route_to("sport_keywords#index")
    end

    it "routes to #new" do
      get("/sport_keywords/new").should route_to("sport_keywords#new")
    end

    it "routes to #show" do
      get("/sport_keywords/1").should route_to("sport_keywords#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sport_keywords/1/edit").should route_to("sport_keywords#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sport_keywords").should route_to("sport_keywords#create")
    end

    it "routes to #update" do
      put("/sport_keywords/1").should route_to("sport_keywords#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sport_keywords/1").should route_to("sport_keywords#destroy", :id => "1")
    end

  end
end
