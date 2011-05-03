require 'fastercsv'
class Admin::AccountTypesController < ApplicationController
 helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items
  # GET /admin/AccountTypes
  # GET /admin/AccountTypes.xml
  def index
    @account_types = AccountType.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @AccountTypes }
    end
  end

  # GET /admin/AccountTypes/1
  # GET /admin/AccountTypes/1.xml
  def show
    @account_type = AccountType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @accountType }
    end
  end

  # GET /admin/AccountTypes/new
  # GET /admin/AccountTypes/new.xml
  def new
    @account_type = AccountType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @AccountType }
    end
  end

  # GET /admin/AccountTypes/1/edit
  def edit
    @account_type = AccountType.find(params[:id])
  end

  # POST /admin/AccountTypes
  # POST /admin/AccountTypes.xml
  def create
    @account_type = AccountType.new(params[:account_type])
     @account_type.created_by = @created_by
    respond_to do |format|
      if @account_type.save
        format.html { redirect_to([:admin,@account_type], :notice => 'Account Type was successfully created.') }
        format.xml  { render :xml => @admin_account_type, :status => :created, :location => @account_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/AccountTypes/1
  # PUT /admin/AccountTypes/1.xml
  def update
    @account_type = AccountType.find(params[:id])
     @account_type.updated_by = @updated_by
    respond_to do |format|
      if @account_type.update_attributes(params[:account_type])
        format.html { redirect_to([:admin, @account_type], :notice => 'Account Type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml =>  @account_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/AccountTypes/1
  # DELETE /admin/AccountTypes/1.xml
  def destroy
    @account_type = AccountType.find(params[:id])
    @account_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_account_types_url) }
      format.xml  { head :ok }
    end
  end

    def export
    @account_types = AccountType.search(params[:search]).order("name")
    outfile = "AccountTypes" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Name","Create at","Created By"]
      @account_types.each do |account_type|
        csv << [account_type.name,account_type.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(account_type.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
 private

  def recent_items
    @recent_account_types = AccountType.find(:all,:limit=>10,:order=>'created_at DESC')
  end

  def sort_column
    AccountType.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

