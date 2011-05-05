require 'fastercsv'
class Admin::CscBlocksController < ApplicationController
     helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items

  def index
    @csc_blocks  = CscBlock.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @csc_blocks }
    end
  end

  def show
    @csc_block = CscBlock.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @csc_block }
    end
  end

  def new
    @csc_block = CscBlock.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @csc_block }
    end
  end

  def edit
    @csc_block = CscBlock.find(params[:id])
  end

  def create
    @csc_block = CscBlock.new(params[:csc_block])
    @csc_block.created_by = @created_by
    respond_to do |format|
      if @csc_block.save
        format.html { redirect_to([:admin,@csc_block], :notice => 'CSC Block was successfully created.') }
        format.xml  { render :xml => @csc_block, :status => :created, :location => @csc_block }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @csc_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @csc_block = CscBlock.find(params[:id])
    @csc_block.updated_by = @updated_by
    respond_to do |format|
      if @csc_block.update_attributes(params[:csc_block])
        format.html { redirect_to([:admin,@csc_block], :notice => 'Csc block was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @csc_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @csc_block = CscBlock.find(params[:id])
    @csc_block.destroy

    respond_to do |format|
      format.html { redirect_to(admin_csc_blocks_url) }
      format.xml  { head :ok }
    end
  end
  
  def export
    @csc_blocks = CscBlock.search(params[:search]).order("name")
    outfile = "csc_blocks" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["State Name","BiddingZoneName","DistrictName","Name","Description","Create at","Created By"]
      @csc_blocks.each do |csc_block|
        csv << [csc_block.state.name,csc_block.bidding_zone.name,csc_block.district.name,csc_block.name,csc_block.description,csc_block.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(csc_block.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
  
  def load_bidding_zones
		@bidding_zones = BiddingZone.where(:state_id => params[:id])
			render :update do |page|
				page[:csc_block_bidding_zone_id].replace collection_select(:csc_block,:bidding_zone_id, @bidding_zones, :id, :name,{:prompt=>'Select Bidding Zone'},
				   { :onchange=>"#{remote_function(:url=>{:action=>'load_districts'},:with =>"'id='+value")}" })
			end
  end
  
  def load_districts
		@districts = District.where(:bidding_zone_id => params[:id])
			render :update do |page|
				page[:csc_block_district_id].replace collection_select(:csc_block,:district_id, @districts, :id, :name,{:prompt=>'Select District'})
			end
  end

  private

  def recent_items
    @recent_csc_blocks = CscBlock.find(:all,:limit=>10,:order=>'created_at DESC')
  end

  def sort_column
    CscBlock.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

