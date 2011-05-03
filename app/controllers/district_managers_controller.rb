#Chaitanya
class DistrictManagersController < ApplicationController
  layout "dmanager"
  before_filter :require_user

    
  def index
  end
 
  def vle_profile
 #     role = Role.find_by_name('vle_representative')
 #     @vle_users = role.users.order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
      @vlemail = User.find(:first, :conditions=>{:id=>@created_by})
      if @vlemail.email == 'chapra@sarkcsc.in'
       	  @vles=VleRepresentativeProfile.find(:all, :conditions=>{:district_id=>1})
 	  elsif @vlemail.email == 'gopalgunj@sarkcsc.in'
 	  	  @vles=VleRepresentativeProfile.find(:all, :conditions=>{:district_id=>2})
  	  elsif @vlemail.email == 'sharsha@sarkcsc.in'
 	 	 @vles=VleRepresentativeProfile.find(:all, :conditions=>{:district_id=>3})
 	  elsif @vlemail.email == 'madhepura@sarkcsc.in'
 	 	 @vles=VleRepresentativeProfile.find(:all, :conditions=>{:district_id=>4})
 	  elsif @vlemail.email == 'supaul@sarkcsc.in'
 	 	 @vles=VleRepresentativeProfile.find(:all, :conditions=>{:district_id=>5})
 	  elsif @vlemail.email == 'siwan@sarkcsc.in'
 	 	 @vles=VleRepresentativeProfile.find(:all, :conditions=>{:district_id=>6})
 	  end
      
  end
  
  def show
      @vle = VleRepresentativeProfile.find(params[:id])
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
          }, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit_profile" }
        format.xml  { render :xml => @vle_representative.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show_profile
  		@vle_user =  User.find(params[:id])
  end
  
  def reports
  end

end
