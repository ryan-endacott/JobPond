require "spec_helper"

describe EmployeesController do
  describe "routing" do

    it "routes to #new" do
      get("/employee/new").should route_to("employees#new")
    end

    it "routes to #show" do
      get("/employee").should route_to("employees#show")
    end

    it "routes to #edit" do
      get("/employee/edit").should route_to("employees#edit")
    end

    it "routes to #create" do
      post("/employee").should route_to("employees#create")
    end

    it "routes to #update" do
      put("/employee").should route_to("employees#update")
    end

    it "routes to #destroy" do
      delete("/employee").should route_to("employees#destroy")
    end

  end
end
