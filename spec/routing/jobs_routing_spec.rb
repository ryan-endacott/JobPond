require "spec_helper"

describe Employers::JobsController do
  describe "routing" do

    it "routes to #index" do
      get("/employers/dashboard").should route_to("employers/dashboard#show")
    end

    it "routes to #new" do
      get("/employers/jobs/new").should route_to("employers/jobs#new")
    end

    it "routes to #show" do
      get("/employers/jobs/1").should route_to("employers/jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employers/jobs/1/edit").should route_to("employers/jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employers/jobs").should route_to("employers/jobs#create")
    end

    it "routes to #update" do
      put("/employers/jobs/1").should route_to("employers/jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employers/jobs/1").should route_to("employers/jobs#destroy", :id => "1")
    end

  end
end
