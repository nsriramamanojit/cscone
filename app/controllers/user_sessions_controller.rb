class UserSessionsController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  layout nil
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      user = User.find_by_email(params[:user_session][:email]) 
      #  puts "############  #{user.id}"
      super_admin = Role.find_by_name('super_admin')  
      admin = Role.find_by_name('admin')
      vle_representative = Role.find_by_name('vle_representative')  
      dmanager = Role.find_by_name('dmanager')
      dengineer = Role.find_by_name('dengineer')
      if user.status == "Approved"
      if user.roles.include?(super_admin) 
        redirect_back_or_default(root_url)
      elsif user.roles.include?(admin) 
        redirect_back_or_default(admin_vle_representatives_path)
      elsif user.roles.include?(dmanager)
      	 redirect_to(:controller=>'district_managers',:action=>'index')
      elsif user.roles.include?(dengineer)
      	redirect_back_or_default(district_engineers_path)
      else user.roles.include?(vle_representative)
        redirect_to(:controller=>'district_engineers',:action=>'index')
      end
      
      else
       # @user_session.destroy
        flash[:error] = "Your Account Not Approved,Please contact Super admin for more info.."
      end
  else
    flash[:error] = "Invalid username or password"
    render :action => :new
  end
end

def destroy
  current_user_session.destroy
  flash[:notice] = "Logout successful!"
  redirect_back_or_default new_user_session_url
end
end
