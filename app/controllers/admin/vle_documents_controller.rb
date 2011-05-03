require 'fastercsv'
class Admin::VleDocumentsController < ApplicationController
    helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items

  # GET /admin/vle_documents
  # GET /admin/vle_documents.xml
  def index
    @vle_documents = VleDocument.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @vle_documents }
    end
  end

  # GET /admin/vle_documents/1
  # GET /admin/vle_documents/1.xml
  def show
    @vle_document = VleDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @vle_document }
    end
  end

  # GET /admin/vle_documents/new
  # GET /admin/vle_documents/new.xml
  def new
    @vle_document = VleDocument.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vle_document }
    end
  end

  # GET /admin/vle_documents/1/edit
  def edit
    @vle_document = VleDocument.find(params[:id])
  end

  # POST /admin/vle_documents
  # POST /admin/vle_documents.xml
  def create
    @vle_document = VleDocument.new(params[:vle_document])
    @vle_document.created_by = @created_by
    respond_to do |format|
      if @vle_document.save
        format.html { redirect_to([:admin,@vle_document], :notice => 'Vle document was successfully created.') }
        format.xml  { render :xml => @vle_document, :status => :created, :location => @vle_document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @vle_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/vle_documents/1
  # PUT /admin/vle_documents/1.xml
  def update
    @vle_document = VleDocument.find(params[:id])
    @vle_document.updated_by = @updated_by
    respond_to do |format|
      if @vle_document.update_attributes(params[:vle_document])
        format.html { redirect_to([:admin,@vle_document], :notice => 'Vle document was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @vle_document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/vle_documents/1
  # DELETE /admin/vle_documents/1.xml
  def destroy
    @vle_document = VleDocument.find(params[:id])
    @vle_document.destroy

    respond_to do |format|
      format.html { redirect_to(admin_vle_documents_url) }
      format.xml  { head :ok }
    end
  end
  def export
    @vle_documents = VleDocument.search(params[:search]).order("agreement_paper")
    outfile = "vle_documents" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["RepresentativeName","AgreementPaper","Address Proof","Education Proof","Photograph Proof","DD Number","DD Date","DD Bank Name","DD Branch Name","DD Amount","Create at","Created By"]
      @vle_documents.each do |vle_document|
        csv << [vle_document.vle_representative.name,vle_document.agreement_paper,vle_document.address_proof,vle_document.education_proof,vle_document.photograph_proof,vle_document.dd_number,vle_document.dd_date,vle_document.dd_bank_name,vle_document.dd_branch_name,vle_document.dd_amount,vle_document.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(vle_document.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
 private

  def recent_items
    @recent_vle_documents = VleDocument.find(:all,:limit=>10,:order=>'created_at DESC')
  end

  def sort_column
    VleDocument.column_names.include?(params[:sort]) ? params[:sort] : "agreement_paper"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end

