require "spec_helper"

describe Admin::ReviewsController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/reviews").should route_to("admin/reviews#index")
    end

    it "routes to #new" do
      get("/admin/reviews/new").should route_to("admin/reviews#new")
    end

    it "routes to #show" do
      get("/admin/reviews/1").should route_to("admin/reviews#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/reviews/1/edit").should route_to("admin/reviews#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/reviews").should route_to("admin/reviews#create")
    end

    it "routes to #update" do
      put("/admin/reviews/1").should route_to("admin/reviews#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/reviews/1").should route_to("admin/reviews#destroy", :id => "1")
    end

  end
end
