class MailingListsController < ApplicationController
 
  def join_list
    render :inline => "request noted"
  end 

=begin  
  resource_controller :except => [:destroy]
  
  create.response do |wants|
    wants.html { redirect_to admin_mailing_lists_path }
  end
  
  update.response do |wants|
    wants.html { redirect_to admin_mailing_lists_path }
  end
  
  show.response do |wants|
    wants.html { render :text => @mailing_list.users.collect(&:email).join(", ") }
  end
=end

end
