require 'fastercsv'
require 'csv'
class Admin::VleRepresentativesController < ApplicationController
  helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items
  
  # GET /admin/vle_representatives
  # GET /admin/vle_representatives.xml
  def index
    role = Role.find_by_name('vle_representative')
    @vle_users = role.users.order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vle_users }
    end
  end
  #Omprakas Mehta
  # GET /admin/vle_representatives/1
  # GET /admin/vle_representatives/1.xml
  def show
    @vle_user =  User.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vle_representative }
    end
  end
  
  # GET /admin/vle_representatives/new
  # GET /admin/vle_representatives/new.xml
  def new
    @user = User.new
    @user.build_vle_representative_profile
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml =>  @user }
    end
  end
  
  # GET /admin/vle_representatives/1/edit
  def edit
    @user = User.find(params[:id])
    # @vle_user.build_vle_representative_profile
  end
  
  # POST /admin/vle_representatives
  # POST /admin/vle_representatives.xml
  def create
    @user = User.new(params[:user])
    @user.created_by = @created_by
    respond_to do |format|
      if @user.save
        format.html { redirect_to({:controller=>'vle_representatives',:action=>'new'}, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @vle_user, :status => :created, :location => @vle_representative }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /admin/vle_representatives/1
  # PUT /admin/vle_representatives/1.xml
  
  def update
    @user = User.find(params[:id])
    @user.updated_by = @updated_by
    respond_to do |format|
      if @user.update_attributes(params[:user])
        
        format.html { redirect_to({:action=>'show',:id=>@user.id
          }, :notice => 'Vle representative was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vle_representative.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  
  def destroy
    @vle_user= User.find(params[:id])
    @vle_user.destroy
    respond_to do |format|
      format.html { redirect_to(admin_vle_representatives_url) }
      format.xml  { head :ok }
    end
  end
  def vle_document
    @vle_documents = VleDocument.all
    #@vle_documents = VleDocument.all
  end
  def vle_profile
    role = Role.find_by_name('vle_representative')
    @vle_users = role.users.order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
  end
  def disable_representative
      role = Role.find_by_name('vle_representative')
     @users = role.users
   end 
  def update_vle_representative
   puts "#############  #{params[:user_vle_representative_profile_attributes][:user_id]}"
  end
  def reset_password
    @user = User.find(params[:id])
    @user.password= @user.password_confirmation=@user.email
   respond_to do |format|
      if @user.update_attributes(params[:user])
        
        format.html { redirect_to({:action=>'upload_password',:id=>@user.id
          }, :notice => 'Vle representative password is  successfully Reset.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vle_representative.errors, :status => :unprocessable_entity }
      end
    end
    # @vle_user.build_vle_representative_profile
  end
 def upload_password
  role = Role.find_by_name('vle_representative')
     @users = role.users
  end
 
  def csv_import
   @vle_user=CSV::Reader.parse(params[:upload][:file])
   n=0
   @vle_user.each do |row|
   user = User.create do |u|
       u.name  =row[0]
       u.email = row[1]
      u.password = u.password_confirmation = row[1]
      u.phone_number = row[2]
      u.status = 'Approved'
      u.created_by = 1
      u.updated_by=1
    end
    if user.save
   Assignment.create(:user_id=>user.id,:role_id=>3,:created_at=>Time.now,:updated_at=>Time.now)        
    c=VleRepresentativeProfile.new  
    c.state_id= 1 
    c.user_id = user.id
    bidding_zone = BiddingZone.find_by_name(row[4].strip)
    c.bidding_zone_id=bidding_zone.id
    district=District.find_by_name(row[5].strip)
    c.district_id =district.id
    csc_block=CscBlock.find_by_name(row[6].strip)
    c.csc_block_id = csc_block.id
    c.father_name=row[7]
    c.address=row[8]
    c.pincode=row[9]
    c.csc_panchayat=row[10]
   if  c.save!
    n=n+1
    GC.start if n%50==0
    flash[:notice]= "The  #{n} Records are imported sucessfully"
       end
      end
    end
  end
  def upload
  end
  def load_bidding_zones
    @bidding_zones = BiddingZone.where(:state_id => params[:id])
    render :update do |page|
 page[:user_vle_representative_profile_attributes_bidding_zone_id].replace collection_select(:user_vle_representative_profile_attributes,:bidding_zone_id, @bidding_zones, :bidding_zone.id, :name,{:prompt=>'Select Bidding Zone'},
      { :onchange=>"#{remote_function(:url=>{:action=>'load_districts'},:with =>"'id='+value")}" })
    end
  end
  def load_districts
    @districts = District.where(:bidding_zone_id => params[:id])
    render :update do |page|
      page[:user_vle_representative_profile_attributes_district_id].replace collection_select(:user_vle_representative_profile_attributes,:district_id, @districts, :district.id, :name,{:prompt=>'Select district'},
      { :onchange=>"#{remote_function(:url=>{:action=>'load_csc_blocks'},:with =>"'id='+value")}" })
    end
  end
  def load_csc_blocks
    @csc_blocks = CscBlock.where(:district_id => params[:id])
    render :update do |page|
      page[:user_vle_representative_profile_attributes_csc_block_id].replace collection_select(:user_vle_representative_profile_attributes,:csc_block_id, @csc_blocks, :csc_block.id, :name,{:prompt=>'select CSCblock'})
#,
 #     :onchange=>"#{remote_function(:url=>{:action=>'load_vle_representatives'},:with =>"'id='+value")}")
    end
  end
  
   #def load_vle_representatives   
    # @users = User.joins("LEFT OUTER JOIN vle_representative_profiles ON vle_representative_profiles.csc_block_id = #{params[:id]}")
 #   puts "###########-------     #{@users.size}"
  #  render :update do |page|
   #   page[:user_vle_representative_profile_attributes_user_id].replace collection_select(:user_vle_representative_profile_attributes,:user_id, @users, :id, :name,{:prompt=>'select User'})
    #end
 # end
  
  def export
    @vle_users = Role.find_by_name('vle_representative').users#User.search(params[:search]).order("name")
    outfile = "vle_representatives" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
      csv_data = FasterCSV.generate do |csv|
      csv << ["Name","Email","Father Name","Address","Pincode","Date Of Biirth","CSC Panchayath","Create at","Created By"]
      @vle_users.each do |vle_user|
        csv << [vle_user.name,vle_user.email,vle_user.vle_representative_profile.father_name,vle_user.vle_representative_profile.address,vle_user.vle_representative_profile.pincode,vle_user.vle_representative_profile.date_of_birth,vle_user.vle_representative_profile.csc_panchayat ,vle_user.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(vle_user.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"
    
  end
  def vle_report
role = Role.find_by_name('vle_representative')
    @vle_users = role.users
 @reports = Banking.where(:created_by=>params[:id])

  end
  def bulk_mailing
   role = Role.find_by_name('vle_representative')
    @vle_users = role.users
    @districts=District.all
  end
  private
  
  def recent_items
    @recent_vle_users = User.find(:all,:limit=>10,:order=>'created_at DESC')
  end
  
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
