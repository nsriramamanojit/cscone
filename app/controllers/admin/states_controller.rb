require 'fastercsv'
class Admin::StatesController < ApplicationController
 helper_method :sort_column, :sort_direction
  layout 'admin'
  before_filter :require_user
  before_filter :recent_items
  # GET /admin/states
  # GET /admin/states.xml
  def index
    @states = State.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page =>page,:per_page=>per_page )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @states }
    end
  end

  # GET /admin/states/1
  # GET /admin/states/1.xml
  def show
    @state = State.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @state }
    end
  end

  # GET /admin/states/new
  # GET /admin/states/new.xml
  def new
    @state = State.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @state }
    end
  end

  # GET /admin/states/1/edit
  def edit
    @state = State.find(params[:id])
  end

  # POST /admin/states
  # POST /admin/states.xml
  def create
    @state = State.new(params[:state])
     @state.created_by = @created_by
    respond_to do |format|
      if @state.save
        format.html { redirect_to([:admin,@state], :notice => 'State was successfully created.') }
        format.xml  { render :xml => @admin_state, :status => :created, :location => @state }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/states/1
  # PUT /admin/states/1.xml
  def update
    @state = State.find(params[:id])
     @state.updated_by = @updated_by
    respond_to do |format|
      if @state.update_attributes(params[:state])
        format.html { redirect_to([:admin,@state], :notice => 'State was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @state.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/states/1
  # DELETE /admin/states/1.xml
  def destroy
    @state = State.find(params[:id])
    @state.destroy

    respond_to do |format|
      format.html { redirect_to(admin_states_url) }
      format.xml  { head :ok }
    end
  end

     def export
    @states = State.search(params[:search]).order("name")
    outfile = "states" + Time.now.strftime("%d-%m-%Y-%H-%M-%S") + ".csv"
    csv_data = FasterCSV.generate do |csv|
      csv << ["Name","Create at","Created By"]
      @states.each do |state|
        csv << [state.name,state.description,state.created_at.strftime('%d-%m-%Y %H:%M:%S'),User.find(state.created_by).name]
      end
    end
    send_data csv_data,
    :type => 'text/csv; charset=iso-8859-1; header=present',
    :disposition => "attachment; filename=#{outfile}"

  end
 private

  def recent_items
    @recent_states = State.find(:all,:limit=>10,:order=>'created_at DESC')
  end

  def sort_column
    State.column_names.include?(params[:sort]) ? params[:sort] : "description"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

