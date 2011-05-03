class Admin::InsurancePremiaController < ApplicationController
  # GET /admin/insurance_premia
  # GET /admin/insurance_premia.xml
  def index
    @admin_insurance_premias = Admin::InsurancePremium.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_insurance_premias }
    end
  end

  # GET /admin/insurance_premia/1
  # GET /admin/insurance_premia/1.xml
  def show
    @admin_insurance_premium = Admin::InsurancePremium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_insurance_premium }
    end
  end

  # GET /admin/insurance_premia/new
  # GET /admin/insurance_premia/new.xml
  def new
    @admin_insurance_premium = Admin::InsurancePremium.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_insurance_premium }
    end
  end

  # GET /admin/insurance_premia/1/edit
  def edit
    @admin_insurance_premium = Admin::InsurancePremium.find(params[:id])
  end

  # POST /admin/insurance_premia
  # POST /admin/insurance_premia.xml
  def create
    @admin_insurance_premium = Admin::InsurancePremium.new(params[:admin_insurance_premium])

    respond_to do |format|
      if @admin_insurance_premium.save
        format.html { redirect_to(@admin_insurance_premium, :notice => 'Insurance premium was successfully created.') }
        format.xml  { render :xml => @admin_insurance_premium, :status => :created, :location => @admin_insurance_premium }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_insurance_premium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/insurance_premia/1
  # PUT /admin/insurance_premia/1.xml
  def update
    @admin_insurance_premium = Admin::InsurancePremium.find(params[:id])

    respond_to do |format|
      if @admin_insurance_premium.update_attributes(params[:admin_insurance_premium])
        format.html { redirect_to(@admin_insurance_premium, :notice => 'Insurance premium was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_insurance_premium.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/insurance_premia/1
  # DELETE /admin/insurance_premia/1.xml
  def destroy
    @admin_insurance_premium = Admin::InsurancePremium.find(params[:id])
    @admin_insurance_premium.destroy

    respond_to do |format|
      format.html { redirect_to(admin_insurance_premias_url) }
      format.xml  { head :ok }
    end
  end
end
