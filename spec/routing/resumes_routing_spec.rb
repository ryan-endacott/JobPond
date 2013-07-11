require "spec_helper"

describe ResumesController do
  describe "routing" do

    it "routes to #edit" do
      get("/employee/resume/editj").should route_to("resumes#edit")
    end

    it "routes to #update" do
      put("/employee/resume").should route_to("resumes#update")
    end

  end
end
