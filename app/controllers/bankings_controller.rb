require 'fastercsv'
class BankingsController < ApplicationController
  helper_method :sort_column, :sort_direction
  layout 'common'
 
  before_filter :require_user
  before_filter :recent_items
 
  def index
	  @bankings = Banking.where(:created_by=>current_user.id).search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
   
  end

  def show
    @banking = Banking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @banking }
    end
  end

  def show_profile
   @vle_user =  User.find(params[:id])
  end

  def edit_profile
   @user = User.find(params[:id])
  end

  def update_profile
   @vle_user = User.find(params[:id])
    @vle_user.updated_by = @updated_by
    respond_to do |format|
      if @vle_user.update_attributes(params[:user])
        
        format.html { redirect_to({:action=>'show_profile',:id=>current_user.id
          }, :notice => 'Vle representative was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_profile" }
        format.xml  { render :xml => @vle_representative.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @banking = Banking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @banking }
    end
  end

  def edit
    @banking = Banking.find(params[:id])
  end

  def create
    @banking = Banking.new(params[:banking])
     @banking.created_by = @created_by
     @banking.user_id = @created_by
     @banking.date = Time.now.strftime("%Y-%m-%d")
     
    respond_to do |format|
      if @banking.save
        format.html { redirect_to(@banking, :notice => 'Bank Account was successfully created.') }
        format.xml  { render :xml => @banking, :status => :created, :location => @banking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @banking.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @banking = Banking.find(params[:id])
      @banking.updated_by = @created_by
       @banking.user_id = @created_by
       @banking.date = Time.now.strftime("%Y-%m-%d")

    respond_to do |format|
      if @banking.update_attributes(params[:banking])
        format.html { redirect_to(@banking, :notice => 'Bank was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @banking.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @banking = Banking.find(params[:id])
    @banking.destroy

    respond_to do |format|
      format.html { redirect_to(bankings_url) }
      format.xml  { head :ok }
    end
  end

  def export
    @bankings = Banking.search(params[:search]).order("bank_name")
    outfile = "bankings" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Name","AccountType","Account Number","Father Name","Name Of Holder","Address","Create at","Created By"]
      @bankings.each do |bank|
        csv << [bank.bank_name,bank.account_type.name,bank.account_number,bank.father_name,bank.name_of_holder,bank.address,bank.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(bank.created_by).name]
          end
      end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end


  private

  def recent_items
    @recent_bankings = Banking.where(:created_by=>current_user.id)
  end

  def sort_column
    Banking.column_names.include?(params[:sort]) ? params[:sort] : "account_number"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
