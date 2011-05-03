class Admin::ReportsController < ApplicationController
  layout 'reports'
  def index
  end
  def banking
  end
  def banking_report
    start_date = Date.civil(params[:report]["start_date(1i)"].to_i,params[:report]["start_date(2i)"].to_i,params[:report]["start_date(3i)"].to_i)
    end_date = Date.civil(params[:report]["end_date(1i)"].to_i,params[:report]["end_date(2i)"].to_i,params[:report]["end_date(3i)"].to_i)
 @bankings = Banking.where(:date=>start_date..end_date).select("count(*) as records,user_id").group('user_id')
 
    html = render_to_string :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "Bankreport.pdf", :type => 'application/pdf')
	
  end  
  def insurance 
  end
  def insurance_report
  start_date = Date.civil(params[:report]["start_date(1i)"].to_i,params[:report]["start_date(2i)"].to_i,params[:report]["start_date(3i)"].to_i)
    end_date = Date.civil(params[:report]["end_date(1i)"].to_i,params[:report]["end_date(2i)"].to_i,params[:report]["end_date(3i)"].to_i)
 @insurances = Insurance.where(:date=>start_date..end_date).select("count(*) as records,user_id").group('user_id')
 
     html = render_to_string :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "InsurenceReport.pdf", :type => 'application/pdf')
  end
  def banking_transaction
  end
  def banking_transaction_report
  start_date = Date.civil(params[:report]["start_date(1i)"].to_i,params[:report]["start_date(2i)"].to_i,params[:report]["start_date(3i)"].to_i)
    end_date = Date.civil(params[:report]["end_date(1i)"].to_i,params[:report]["end_date(2i)"].to_i,params[:report]["end_date(3i)"].to_i)
    @transactions = Transaction.where(:date=>start_date..end_date).select("count(*) as records,user_id").group('user_id')
      
    html = render_to_string :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "BankTransaction.pdf", :type => 'application/pdf')
   end
  def insurance_transaction
  end
  def insurance_transaction_report
  start_date = Date.civil(params[:report]["start_date(1i)"].to_i,params[:report]["start_date(2i)"].to_i,params[:report]["start_date(3i)"].to_i)
    end_date = Date.civil(params[:report]["end_date(1i)"].to_i,params[:report]["end_date(2i)"].to_i,params[:report]["end_date(3i)"].to_i)

   @insurance_transactions = InsuranceTransaction.where(:date=>start_date..end_date).select("count(*) as records,user_id").group('user_id')
    html = render_to_string :layout => false 
	kit = PDFKit.new(html)

	kit.stylesheets << RAILS_ROOT + '/public/stylesheets/styles.css' 

	send_data(kit.to_pdf, :filename => "InsurenceTransaction.pdf", :type => 'application/pdf')    
  end
end
