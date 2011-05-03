require 'fastercsv'
class TransactionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /transactions
  # GET /transactions.xml
 layout 'common'
  before_filter :require_user
  before_filter :recent_items
  def index
  @transactions = Transaction.where(:created_by=>current_user.id).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transactions }
    end
  end

  # GET /transactions/1
  # GET /transactions/1.xml
  def show
    @transaction = Transaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/new
  # GET /transactions/new.xml
  def new
    @transaction = Transaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transaction }
    end
  end

  # GET /transactions/1/edit
  def edit
    @transaction = Transaction.find(params[:id])
  end

  # POST /transactions
  # POST /transactions.xml
  def create
    @transaction = Transaction.new(params[:transaction])
    @transaction.created_by = @created_by
    @transaction.user_id= @created_by
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to(@transaction, :notice => 'Transaction was successfully created.') }
        format.xml  { render :xml => @transaction, :status => :created, :location => @transaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transactions/1
  # PUT /transactions/1.xml
  def update
    @transaction = Transaction.find(params[:id])
    @transaction.updatesd_by = @updated_by
    @transaction.user_id = @created_by
    respond_to do |format|
      if @transaction.update_attributes(params[:transaction])
        format.html { redirect_to(@transaction, :notice => 'Transaction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.xml
  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to(transactions_url) }
      format.xml  { head :ok }
    end
  end
   def export
    @transactions = Transaction.search(params[:search]).order("bank_name")
    outfile = "transactions" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Name","Account Number","Mode Of Transaction","Amount","Create at","Created By"]
      @transactions.each do |transaction|
        csv << [transaction.bank_name,transaction.account_number,transaction.mode_of_transaction,transaction.amount,transaction.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(transaction.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
private

  def recent_items
    @recent_transactions = Transaction.where(:created_by=>current_user.id)
  end

  def sort_column
    Transaction.column_names.include?(params[:sort]) ? params[:sort] : "bank_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
