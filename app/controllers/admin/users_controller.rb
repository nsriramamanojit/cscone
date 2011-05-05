require 'fastercsv'
class  Admin::UsersController < ApplicationController
  layout 'admin'
  helper_method :sort_column, :sort_direction
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:index,:show, :edit, :update]
  before_filter :recent_users
  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    @user.created_by = @created_by
    respond_to do |format|
      if @user.save
        format.html { redirect_to(admin_users_path, :notice => 'User was successfully created.') }    
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    
    @user = User.find(params[:id])
    params[:user][:role_ids] ||= []
    
    @user.updated_by = @updated_by
    respond_to do |format|
      if @user.update_attributes(params[:user])     
        format.html { redirect_to([:admin,@user], :notice => 'VLE Representative was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def export
    @users = User.order("name") 
    outfile = "users-" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Name","Email","Phone Number","Status","Roles","Created At","Created By"]
      @users.each do |user|
        roles = ''
        for role in user.roles
          roles << "#{role.name},"
        end  
        csv << [user.name,user.email,user.phone_number,user.status,roles,
        user.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(user.created_by).name]
      end 
    end 
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"
    
  end  
  
  def update_status
    @user = User.find(params[:id])
    status = @user.status
    @user.update_attribute('status',params[:status])
    flash[:success] = "#{@user.name}  has been updated from #{status} to #{@user.status}"
   
    respond_to do |format|
      format.html{redirect_to(admin_users_path) }
      format.xml  { render :xml => @degree.errors, :status => :unprocessable_entity  }
    end
  end

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def recent_users
    @recent_users = User.find(:all,:limit=>10,:order=>'created_at DESC')
  end   
end
