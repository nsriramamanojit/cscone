require 'fastercsv'
class InsuranceTransactionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /insurance_transactions
  # GET /insurance_transactions.xml
 layout 'common'
  before_filter :require_user
  before_filter :recent_items
  def index

  @insurance_transactions = InsuranceTransaction.where(:created_by=>current_user.id).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
   
  end

  # GET /insurance_transactions/1
  # GET /insurance_transactions/1.xml
  def show
    @insurance_transaction = InsuranceTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @insurance_transaction }
    end
  end
 
  # GET /insurance_transactions/new
  # GET /insurance_transactions/new.xml
  def new
    @insurance_transaction = InsuranceTransaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @insurance_transaction }
    end
  end

  # GET /insurance_transactions/1/edit
  def edit
    @insurance_transaction = InsuranceTransaction.find(params[:id])
  end

  # POST /insurance_transactions
  # POST /insurance_transactions.xml
  def create
    @insurance_transaction = InsuranceTransaction.new(params[:insurance_transaction])
     @insurance_transaction .created_by = @created_by
        @insurance_transaction .user_id = @created_by
    respond_to do |format|
      if @insurance_transaction.save
        format.html { redirect_to(@insurance_transaction, :notice => 'Bank was successfully created.') }
        format.xml  { render :xml => @insurance_transaction, :status => :created, :location => @insurance_transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @insurance_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /insurance_transactions/1
  # PUT /insurance_transactions/1.xml
  def update
    @insurance_transaction = InsuranceTransaction.find(params[:id])
      @insurance_transaction .updated_by = @created_by
       @insurance_transaction .user_id = @created_by
    respond_to do |format|
      if @insurance_transaction.update_attributes(params[:insurance_transaction])
        format.html { redirect_to(@insurance_transaction, :notice => 'Bank was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @insurance_transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /insurance_transactions/1
  # DELETE /insurance_transactions/1.xml
  def destroy
    @insurance_transaction = InsuranceTransaction.find(params[:id])
    @insurance_transaction.destroy

    respond_to do |format|
      format.html { redirect_to(insurance_transactions_url) }
      format.xml  { head :ok }
    end
  end
   def export
    @insurance_transactions = InsuranceTransaction.search(params[:search]).order("company")
    outfile = "insurance_transactions" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Company","Policy Name","Policy Number","Premium Amount","Remarks","Create at","Created By"]
      @insurance_transactions.each do |insurance_transaction|
        csv << [insurance_transaction.company,insurance_transaction.policy_name,insurance_transaction.policy_number,insurance_transaction.premium_amount,insurance_transaction.remarks,insurance_transaction.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(insurance_transaction.created_by).name]
          end
      end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
  private

  def recent_items
    @recent_insurance_transactions = InsuranceTransaction.where(:created_by=>current_user.id)
  end

  def sort_column
    InsuranceTransaction.column_names.include?(params[:sort]) ? params[:sort] : "company"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
