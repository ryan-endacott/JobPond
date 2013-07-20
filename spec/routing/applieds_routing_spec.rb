require "spec_helper"

describe AppliedsController do
  describe "routing" do

    it "routes to #index" do
      get("/applieds").should route_to("applieds#index")
    end

    it "routes to #new" do
      get("/applieds/new").should route_to("applieds#new")
    end

    it "routes to #show" do
      get("/applieds/1").should route_to("applieds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/applieds/1/edit").should route_to("applieds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/applieds").should route_to("applieds#create")
    end

    it "routes to #update" do
      put("/applieds/1").should route_to("applieds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/applieds/1").should route_to("applieds#destroy", :id => "1")
    end

  end
end
