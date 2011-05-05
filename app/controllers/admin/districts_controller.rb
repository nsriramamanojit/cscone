require 'fastercsv'
class Admin::DistrictsController < ApplicationController
    helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items


  def index
    @districts = District.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @districts}
    end
  end


  def show
    @district = District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @district }
    end
  end


  def new
    @district = District.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @district }
    end
  end


  def edit
    @district = District.find(params[:id])
  end


  def create
    @district = District.new(params[:district])
    @district.created_by = @created_by
    respond_to do |format|
      if @district.save
        format.html { redirect_to([:admin,@district], :notice => 'District was successfully created.') }
        format.xml  { render :xml => @district, :status => :created, :location => @district }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @district.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @district = District.find(params[:id])
    @district.updated_by = @updated_by
    respond_to do |format|
      if @district.update_attributes(params[:district])
        format.html { redirect_to([:admin,@district], :notice => 'District was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @district.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @district = District.find(params[:id])
    @district.destroy

    respond_to do |format|
      format.html { redirect_to(admin_districts_url) }
      format.xml  { head :ok }
    end
  end
     def export
    @districts = District.search(params[:search]).order("name")
    outfile = "districts" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
   csv_data = FasterCSV.generate do |csv|
      csv << ["StateName"," BiddingZoneName","Description","Create at","Created By"]
      @districts.each do |district|
        csv << [district.state.name,district.bidding_zone.name,district.description,district.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(district.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
 
   def load_bidding_zones
		@bidding_zones = BiddingZone.where(:state_id => params[:id])
			render :update do |page|
				page[:district_bidding_zone_id].replace collection_select(:district,:bidding_zone_id, @bidding_zones, :id, :name)
			end
	end

 private

  def recent_items
    @recent_districts = District.find(:all,:limit=>10,:order=>'created_at DESC')
  end

  def sort_column
    District.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
 end

