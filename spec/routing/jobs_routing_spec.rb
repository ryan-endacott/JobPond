require "spec_helper"

describe JobsController do
  describe "routing" do

    it "routes to #index" do
      get("/employer/dashboard").should route_to("employer_dashboard#show")
    end

    it "routes to #new" do
      get("/employer/jobs/new").should route_to("jobs#new")
    end

    it "routes to #show" do
      get("/employer/jobs/1").should route_to("jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employer/jobs/1/edit").should route_to("jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employer/jobs").should route_to("jobs#create")
    end

    it "routes to #update" do
      put("/employer/jobs/1").should route_to("jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employer/jobs/1").should route_to("jobs#destroy", :id => "1")
    end

  end
end
