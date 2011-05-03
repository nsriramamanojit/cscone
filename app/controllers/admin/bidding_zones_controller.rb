require 'fastercsv'
class Admin::BiddingZonesController < ApplicationController
     helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items

  # GET /admin/bidding_zones
  # GET /admin/bidding_zones.xml
  def index
   @bidding_zones = BiddingZone.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bidding_zones }
    end
  end

  # GET /admin/bidding_zones/1
  # GET /admin/bidding_zones/1.xml
  def show
    @bidding_zone = BiddingZone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bidding_zone }
    end
  end

  # GET /admin/bidding_zones/new
  # GET /admin/bidding_zones/new.xml
  def new
    @bidding_zone = BiddingZone.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bidding_zone}
    end
  end

  # GET /admin/bidding_zones/1/edit
  def edit
    @bidding_zone= BiddingZone.find(params[:id])
  end

  # POST /admin/bidding_zones
  # POST /admin/bidding_zones.xml
  def create
    @bidding_zone= BiddingZone.new(params[:bidding_zone])
     @bidding_zone.created_by = @created_by

    respond_to do |format|
      if @bidding_zone.save
        format.html { redirect_to([:admin,@bidding_zone], :notice => 'Bidding zone was successfully created.') }
        format.xml  { render :xml => @bidding_zone, :status => :created, :location => @bidding_zone}
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bidding_zone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/bidding_zones/1
  # PUT /admin/bidding_zones/1.xml
  def update
    @bidding_zone= BiddingZone.find(params[:id])
    @bidding_zone.updated_by = @updated_by
    respond_to do |format|
      if @bidding_zone.update_attributes(params[:bidding_zone])
        format.html { redirect_to([:admin,@bidding_zone], :notice => 'Bidding zone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_bidding_zone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/bidding_zones/1
  # DELETE /admin/bidding_zones/1.xml
  def destroy
    @bidding_zone= BiddingZone.find(params[:id])
    @bidding_zone.destroy

    respond_to do |format|
      format.html { redirect_to(admin_bidding_zones_url) }
      format.xml  { head :ok }
    end
  end
   def export
    @bidding_zones = BiddingZone.search(params[:search]).order("name")
    outfile = "bidding_zones" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
   csv_data = FasterCSV.generate do |csv|
      csv << ["State Name"," Name","Description","Create at","Created By"]
      @bidding_zones.each do |bidding_zone|
        csv << [bidding_zone.state.name,bidding_zone.name,bidding_zone.description,bidding_zone.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(bidding_zone.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
 private

  def recent_items
    @recent_bidding_zones = BiddingZone.find(:all,:limit=>10,:order=>'created_at DESC')
  end

  def sort_column
    State.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

