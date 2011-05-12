class BulkVleMailsController < ApplicationController
 layout "reports"
 before_filter :require_user
 def index
 	@bulk_vle_mails = BulkVleMail.find(:all)
 end
 
 def new
 	@bulk_vle_mail = BulkVleMail.new

 end
 
 def save
 	 puts params[:mail_body]
 	 puts params[:mail_subject]
 	 
     @bulk_vle_mail = BulkVleMail.new(params[:bulk_vle_mail])
    respond_to do |format|
      if @bulk_vle_mail.save
      else
        format.html { render :action => "index" }
      end
    end
 end
 
 def district
  
 end
 
end
