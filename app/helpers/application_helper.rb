module ApplicationHelper
  
  def admin_tabs
    html = ''
    super_admin = Role.find_by_name('super_admin')
    admin = Role.find_by_name('admin')
    vle_representative = Role.find_by_name('vle_representative')
    if current_user.roles.include?(super_admin) 
      
      html << "<li>"
      html << link_to("States",admin_states_path,:class=>(controller_name.eql?('states') ? "active" : ""))
      html << "</li>"
      html << "<li>"
      html << link_to("Bidding Zones",admin_bidding_zones_path,:class=>(controller_name.eql?('bidding_zones') ? "active" : ""))
      html << "</li>"
      html << "<li>"
      html << link_to("Districts",admin_districts_path,:class=>(controller_name.eql?('districts') ? "active" : ""))
      html << "</li>"
      html << "<li>"
      html << link_to("CSC Blocks",admin_csc_blocks_path,:class=>(controller_name.eql?('csc_blocks') ? "active" : ""))
      html << "</li>"
      html << "<li>"
      
      html << link_to("VLE Documents",admin_vle_documents_path,:class=>(controller_name.eql?('vle_documents') ? "active" : ""))
      html << "</li>"
      html << "<li>"
      html << link_to('User Setup',admin_users_path,:class=>(controller_name.eql?('users') ? "users selected" : ""))
      html << '</li>'
    elsif current_user.roles.include?(admin) 
      
      html <<  '<li>'
      html << link_to('New VLE',{:controller=>'vle_representatives',:action=>'new'},:class=>(current_page?(:controller=>'vle_representatives',:action=>'new') ? "vle_representatives selected" : ""))
      html << '</li>'
      html <<  '<li>'
      html << link_to('VLE Status',{:controller=>'vle_representatives',:action=>'disable_representative'},:class=>(current_page?(:controller=>'vle_representatives',:action=>'disable_representative') ? "vle_representatives selected" : ""))
      html << '</li>' 
      html <<  '<li>'
      html << link_to('VLE Profile',{:controller=>'vle_representatives',:action=>'vle_profile'},:class=>(current_page?(:controller=>'vle_representatives',:action=>'vle_profile') ? "vle_representatives selected" : ""))
      html <<  '<li>'
      html << link_to('VLE Documnets',{:controller=>'vle_representatives',:action=>'vle_document'},:class=>(current_page?(:controller=>'vle_representatives',:action=>'vle_document') ? "vle_representatives selected" : ""))
      html << '</li>'
      html <<  '<li>'
      html << link_to('VLE Password Reset',{:controller=>'vle_representatives',:action=>'upload_password'},:class=>(current_page?(:controller=>'vle_representatives',:action=>'upload_password') ? "vle_representatives selected" : ""))
      html << '</li>'
      html <<  '<li>'
      
      html <<  '<li>'
      html <<  '<li>'
      html << link_to('VLE Bulk Mail',{:controller=>'admin/bulk_mails'},:class=>(current_page?(:controller=>'admin/bulk_mails') ? "bulk_mails selected" : ""))
      html << '</li>'    
      
       html <<  '<li>'
      html << link_to('Upload VLE',{:controller=>'vle_representatives',:action=>'upload'},:class=>(current_page?(:controller=>'vle_representatives',:action=>'upload') ? "vle_representatives selected" : ""))
      html << '</li>' 
       html <<  '<li>'
      html << link_to('Account Types',
{:controller=>'account_types',:action=>'index'},:class=>(current_page?(:controller=>'account_types',:action=>'index') ? "account_types selected" : ""))
      html << '</li>' 
       html <<  '<li>'
      html << link_to('Premium Types',
{:controller=>'premia',:action=>'index'},:class=>(current_page?(:controller=>'premia',:action=>'index') ? "premia selected" : ""))
      html << '</li>'    
  html <<  '<li>'
      html << link_to('Reports',{:controller=>'admin/reports'},:class=>(current_page?(:controller=>'admin/reports') ? "reports selected" : ""))
      html << '</li>'    
      html << '</li>' 
     end 
    html.html_safe
  end
  def vle_tabs
    html = ''
      html << "<li>"
      html << link_to('Bank Accounts',{:controller=>'bankings',:action=>'index'},:class=>(controller_name.eql?('bankings') ? "active" : "")) 
      html << "</li>"
      html << "<li>"
      html << link_to('Bank Transactions',{:controller=>'transactions',:action=>'index'},:class=>(controller_name.eql?('transactions') ? "active" : "")) 
      html << "</li>"
       html << "<li>"
      html << link_to('Insurance Accounts',{:controller=>'insurances',:action=>'index'},:class=>(controller_name.eql?('insurances') ? "active" : "")) 
      html << "</li>"
       html << "<li>"
      html << link_to('Insurance Transactions',{:controller=>'insurance_transactions',:action=>'index'},:class=>(controller_name.eql?('insurance_transactions') ? "active" : "")) 
      html << "</li>"
    html.html_safe
  end   
  
    def dmanager_tabs
    html = ''
      html << "<li>"
  html << link_to('VLE Profile',{:controller=>'district_managers',:action=>'vle_profile'},:class=>(current_page?(:controller=>'district_managers',:action=>'vle_profile') ? "district_managers selected" : "")) 
      html << "</li>"
      html << "<li>"
      html << link_to('Reports',{:controller=>'district_managers',:action=>'reports'},:class=>(controller_name.eql?('transactions') ? "active" : "")) 
      html << "</li>"
    html.html_safe
  end   
      def dengineer_tabs
    html = ''
      html << "<li>"
  html << link_to('VLE Profile',{:controller=>'district_engineers',:action=>'vle_profile'},:class=>(current_page?(:controller=>'district_engineers',:action=>'vle_profile') ? "district_engineers selected" : "")) 
      html << "</li>"
      html << "<li>"
      html << link_to('Reports',{:controller=>'district_engineers',:action=>'reports'},:class=>(controller_name.eql?('transactions') ? "active" : "")) 
      html << "</li>"
    html.html_safe
  end 
  
  def sub_menu
    html = ''
    case controller.controller_name
    when 'reports' 
      html << "<div class='sub_menu_header' align='top'><ul><div class='sub_menu'>"
      html <<  '<li>'
      html << link_to('Bankings',{:controller=>'reports',:action=>'banking'},:class=>(current_page?(:controller=>'reports',:action=>'banking') ? "reports selected" : ""))
      html << '</li>' 
      html <<  '<li>'
      html << link_to('BankingTransaction',{:controller=>'reports',:action=>'banking_transaction'},:class=>(current_page?(:controller=>'reports',:action=>'banking_transaction') ? "reports selected" : ""))
      html << '</li>' 
       html <<  '<li>'
      html << link_to('Insurances',{:controller=>'reports',:action=>'insurance'},:class=>(current_page?(:controller=>'reports',:action=>'insurance') ? "reports selected" : ""))
      html << '</li>' 
       html <<  '<li>'
      html << link_to('InsuranceTransactions',{:controller=>'reports',:action=>'insurance_transaction'},:class=>(current_page?(:controller=>'reports',:action=>'insurance_transaction') ? "reports selected" : ""))
      html << '</li>' 
      
      html <<  "</div></ul></div><br/>" 
    end
    return html.html_safe
  end
   def bulk_sub_menu
    html = ''
    case controller.controller_name
    when 'bulk_mails' 
      html << "<div class='sub_menu_header' align='top'><ul><div class='sub_menu'>"
      html <<  '<li>'
      html << link_to('All VLEs',{:controller=>'bulk_mails',:action=>'mail_to_all'},:class=>(current_page?(:controller=>'bulk_mails',:action=>'mail_to_all') ? "bulk_mails selected" : ""))
      html << '</li>' 
      html <<  '<li>'
      html << link_to('Districts',{:controller=>'bulk_mails',:action=>'mail_to_district'},:class=>(current_page?(:controller=>'reports',:action=>'mail_to_district') ? "bulk_mails selected" : ""))
      html << '</li>' 
       
      html <<  "</div></ul></div><br/>" 
    end
    return html.html_safe
  end
  
  
  ####### per page to select user
  def per_page
    select_tag :per_page, options_for_select([5,10,20,30,50,100,200], @per_page.to_i), :onchange => "if(this.value){window.location='?per_page='+this.value+'&page=#{@page}'+'&query=#{@query}'}"
  end
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
  
  
  
  def model_status model
    case model.status
      when 'Approved'       
        return "<font color='green'><b>A</b></font>".html_safe        
      when 'On Hold'   
       return "<font color='#CC8A10'><b>H</b></font>".html_safe      
      when 'Blocked'         
       return "<font color='red'><b>B</b></font>".html_safe    
    end 
  end
  def link_to_model_status model
    html = ''
    case model.status
      when 'On Hold'
      html << link_to("Approve", {:action=>'update_status',:id=>model,:status=>'Approved'}) 
      html << " | "
      html << link_to("Block", {:action=>'update_status',:id=>model,:status=>'Blocked'})
      when 'Approved'
       html << link_to("Block",{:action=>'update_status',:id=>model,:status=>'Blocked'}) 
      when 'Blocked'
       html << link_to("On Hold",{:action=>'update_status',:id=>model,:status=>'On Hold'})
        html << " | "
      html << link_to("Approve", {:action=>'update_status',:id=>model,:status=>'Approved'})
    end
    return html.html_safe
  end
  
end
