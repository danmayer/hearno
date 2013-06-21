require "spec_helper"

describe CampaignStripsController do
  describe "routing" do

    it "routes to #index" do
      get("/campaign_strips").should route_to("campaign_strips#index")
    end

    it "routes to #new" do
      get("/campaign_strips/new").should route_to("campaign_strips#new")
    end

    it "routes to #show" do
      get("/campaign_strips/1").should route_to("campaign_strips#show", :id => "1")
    end

    it "routes to #edit" do
      get("/campaign_strips/1/edit").should route_to("campaign_strips#edit", :id => "1")
    end

    it "routes to #create" do
      post("/campaign_strips").should route_to("campaign_strips#create")
    end

    it "routes to #update" do
      put("/campaign_strips/1").should route_to("campaign_strips#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/campaign_strips/1").should route_to("campaign_strips#destroy", :id => "1")
    end

  end
end
