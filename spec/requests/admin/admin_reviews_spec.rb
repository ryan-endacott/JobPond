require 'spec_helper'

describe Admin::ReviewsController do
  describe "GET /admin_reviews" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
