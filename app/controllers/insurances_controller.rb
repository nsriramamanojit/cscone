require 'fastercsv'
class InsurancesController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /Insurances
  # GET /Insurances.xml
 layout 'common'
  before_filter :require_user
  before_filter :recent_items
  def index
  @insurances = Insurance.where(:created_by=>current_user.id).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insurances }
    end
  end

  # GET /Insurances/1
  # GET /Insurances/1.xml
  def show
    @insurance = Insurance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @insurance }
    end
  end

  # GET /Insurances/new
  # GET /Insurances/new.xml
  def new
    @insurance = Insurance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @Insurance }
    end
  end

  # GET /Insurances/1/edit
  def edit
    @insurance = Insurance.find(params[:id])
  end

  # POST /Insurances
  # POST /Insurances.xml
  def create
    @insurance = Insurance.new(params[:insurance])
    @insurance.created_by = @created_by
    @insurance.user_id= @created_by
    respond_to do |format|
      if @insurance.save
        format.html { redirect_to(@insurance, :notice => 'Insurance was successfully created.') }
        format.xml  { render :xml => @insurance, :status => :created, :location => @insurance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Insurances/1
  # PUT /Insurances/1.xml
  def update
    @insurance = Insurance.find(params[:id])
    @insurance.updatesd_by = @updated_by
    @insurance.user_id = @created_by
    respond_to do |format|
      if @Insurance.update_attributes(params[:insurance])
        format.html { redirect_to(@Insurance, :notice => 'Insurance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @insurance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Insurances/1
  # DELETE /Insurances/1.xml
  def destroy
    @insurance = Insurance.find(params[:id])
    @insurance.destroy

    respond_to do |format|
      format.html { redirect_to(insurances_url) }
      format.xml  { head :ok }
    end
  end
   def export
    @insurances = Insurance.search(params[:search]).order("name")
    outfile = "Insurances" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Name","Policy Number","PremiumType","Amount","Remarks","Create at","Created By"]
      @insurances.each do |insurance|
        csv << [insurance.name,insurance.policy_number,insurance.premium.name,insurance.amount,insurance.remarks,insurance.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(insurance.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
private

  def recent_items
    @recent_insurances = Insurance.where(:created_by=>current_user.id)
  end

  def sort_column
    Insurance.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
