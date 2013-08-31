require 'spec_helper'

describe CampaignStripsController do

  # This should return the minimal set of attributes required to create a valid
  # CampaignStrip. As you add validations to CampaignStrip, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    @user ||= login_admin
    {"title" => "MyString",
      'description' => 'stuff and things',
      'creator_id' => @user.id,
      'campaign_id' => @campaign.id }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CampaignStripsController. Be sure to keep this updated too.
  def valid_session
    @user ||= login_admin
    {"warden.user.user.key" => session["warden.user.user.key"]}
  end

  before(:each) do
    #one campaign is required to create campaign strips
    @campaign = FactoryGirl.create(:campaign)
  end

  describe "GET index" do
    it "assigns all campaign_strips as @campaign_strips" do
      campaign_strip = CampaignStrip.create! valid_attributes
      get :index, {}, valid_session
      assigns(:campaign_strips).should eq([campaign_strip])
    end
  end

  describe "GET show" do
    it "assigns the requested campaign_strip as @campaign_strip" do
      campaign_strip = CampaignStrip.create! valid_attributes
      get :show, {:id => campaign_strip.to_param}, valid_session
      assigns(:campaign_strip).should eq(campaign_strip)
    end
  end

  describe "GET new" do
    it "assigns a new campaign_strip as @campaign_strip" do
   login_user
      get :new, {}, valid_session
      assigns(:campaign_strip).should be_a_new(CampaignStrip)
    end
  end

  describe "GET edit" do
    it "assigns the requested campaign_strip as @campaign_strip" do
      campaign_strip = CampaignStrip.create! valid_attributes
      get :edit, {:id => campaign_strip.to_param}, valid_session
      assigns(:campaign_strip).should eq(campaign_strip)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new CampaignStrip" do
        expect {
          post :create, {:campaign_strip => valid_attributes}, valid_session
        }.to change(CampaignStrip, :count).by(1)
      end

      it "assigns a newly created campaign_strip as @campaign_strip" do
        post :create, {:campaign_strip => valid_attributes}, valid_session
        assigns(:campaign_strip).should be_a(CampaignStrip)
        assigns(:campaign_strip).should be_persisted
      end

      it "redirects to the created campaign_strip" do
        post :create, {:campaign_strip => valid_attributes}, valid_session
        response.should redirect_to(CampaignStrip.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved campaign_strip as @campaign_strip" do
        login_user        
        # Trigger the behavior that occurs when invalid params are submitted
        CampaignStrip.any_instance.stub(:save).and_return(false)
        post :create, {:campaign_strip => { }}, valid_session
        assigns(:campaign_strip).should be_a_new(CampaignStrip)
      end

      it "re-renders the 'new' template" do
        login_user
        # Trigger the behavior that occurs when invalid params are submitted
        CampaignStrip.any_instance.stub(:save).and_return(false)
        post :create, {:campaign_strip => { "title" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested campaign_strip" do
        campaign_strip = CampaignStrip.create! valid_attributes
        # Assuming there are no other campaign_strips in the database, this
        # specifies that the CampaignStrip created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        CampaignStrip.any_instance.should_receive(:update_attributes).with({ "title" => "MyString" })
        put :update, {:id => campaign_strip.to_param, :campaign_strip => { "title" => "MyString" }}, valid_session
      end

      it "assigns the requested campaign_strip as @campaign_strip" do
        campaign_strip = CampaignStrip.create! valid_attributes
        put :update, {:id => campaign_strip.to_param, :campaign_strip => valid_attributes}, valid_session
        assigns(:campaign_strip).should eq(campaign_strip)
      end

      it "redirects to the campaign_strip" do
        campaign_strip = CampaignStrip.create! valid_attributes
        put :update, {:id => campaign_strip.to_param, :campaign_strip => valid_attributes}, valid_session
        response.should redirect_to(campaign_strip)
      end
    end

    describe "with invalid params" do
      it "assigns the campaign_strip as @campaign_strip" do
        login_user
        campaign_strip = CampaignStrip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CampaignStrip.any_instance.stub(:save).and_return(false)
        put :update, {:id => campaign_strip.to_param, :campaign_strip => { "title" => "invalid value" }}, valid_session
        assigns(:campaign_strip).should eq(campaign_strip)
      end

      it "re-renders the 'edit' template" do
        campaign_strip = CampaignStrip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        CampaignStrip.any_instance.stub(:save).and_return(false)
        put :update, {:id => campaign_strip.to_param, :campaign_strip => { "title" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested campaign_strip" do
      campaign_strip = CampaignStrip.create! valid_attributes
      expect {
        delete :destroy, {:id => campaign_strip.to_param}, valid_session
      }.to change(CampaignStrip, :count).by(-1)
    end

    it "redirects to the campaign_strips list" do
      campaign_strip = CampaignStrip.create! valid_attributes
      delete :destroy, {:id => campaign_strip.to_param}, valid_session
      response.should redirect_to(campaign_strips_url)
    end
  end

end
