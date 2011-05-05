require 'fastercsv'
class Admin::PremiaController < ApplicationController
  helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items

  def index
    @premia= Premium.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @AccountTypes }
    end
  end


  def show
    @premium = Premium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accountType }
    end
  end

  def new
    @premium = Premium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @AccountType }
    end
  end

  def edit
    @premium = Premium.find(params[:id])
  end

  def create
    @premium = Premium.new(params[:premium])
     @premium.created_by = @created_by
    respond_to do |format|
      if @premium.save
        format.html { redirect_to([:admin,@premium], :notice => 'Account Type was successfully created.') }
        format.xml  { render :xml => @admin_premium, :status => :created, :location => @premium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @premium.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @premium = Premium.find(params[:id])
     @premium.updated_by = @updated_by
    respond_to do |format|
      if @premium.update_attributes(params[:premium])
        format.html { redirect_to([:admin, @premium], :notice => 'Account Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml =>  @premium.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @premium = Premium.find(params[:id])
    @premium.destroy

    respond_to do |format|
      format.html { redirect_to(admin_premiums_url) }
      format.xml  { head :ok }
    end
  end

    def export
    @premia = Premium.search(params[:search]).order("name")
    outfile = "AccountTypes" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Name","Create at","Created By"]
      @premia.each do |premium|
        csv << [premium.name,premium.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(premium.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
 private

  def recent_items
    @recent_premia = Premium.find(:all,:limit=>10,:order=>'created_at DESC')
  end

  def sort_column
    Premium.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

