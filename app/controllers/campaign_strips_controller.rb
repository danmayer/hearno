class CampaignStripsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  # GET /campaign_strips
  # GET /campaign_strips.json
  def index
    @campaign_strips = CampaignStrip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaign_strips }
    end
  end

  # GET /campaign_strips/1
  # GET /campaign_strips/1.json
  def show
    @campaign_strip = CampaignStrip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @campaign_strip }
    end
  end

  # GET /campaign_strips/new
  # GET /campaign_strips/new.json
  def new
    @campaign_strip = CampaignStrip.default_strip

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @campaign_strip }
    end
  end

  # GET /campaign_strips/1/edit
  def edit
    @campaign_strip = CampaignStrip.find(params[:id])
  end

  # POST /campaign_strips
  # POST /campaign_strips.json
  def create
    default_values = {:campaign_id => Campaign.first.id, :creator_id => current_user.id}
    campaign_strip_with_defaults = params[:campaign_strip].merge(default_values)
    
    @campaign_strip = CampaignStrip.new(campaign_strip_with_defaults)

    respond_to do |format|
      if @campaign_strip.save
        format.html { redirect_to @campaign_strip, notice: 'Campaign strip was successfully created.' }
        format.json { render json: @campaign_strip, status: :created, location: @campaign_strip }
      else
        format.html { render action: "new" }
        format.json { render json: @campaign_strip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /campaign_strips/1
  # PUT /campaign_strips/1.json
  def update
    @campaign_strip = CampaignStrip.find(params[:id])

    respond_to do |format|
      if @campaign_strip.update_attributes(params[:campaign_strip])
        format.html { redirect_to @campaign_strip, notice: 'Campaign strip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @campaign_strip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_strips/1
  # DELETE /campaign_strips/1.json
  def destroy
    @campaign_strip = CampaignStrip.find(params[:id])
    @campaign_strip.destroy

    respond_to do |format|
      format.html { redirect_to campaign_strips_url }
      format.json { head :no_content }
    end
  end
end
