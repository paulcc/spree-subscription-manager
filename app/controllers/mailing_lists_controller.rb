class MailingListsController < ApplicationController
  before_filter :require_no_user, :only => [:blank_join_list]
 
  def blank_join_list
    if params[:signup] && params[:signup][:email]
      user = User.new
      user.password = user.password_confirmation = "1234"
      user.email = params[:signup][:email]
      user.name = user.email 

      if user.save
        flash[:notice] = "Thank you. We will add <strong>#{params[:signup][:email]}</strong> to the offers newsletter."
        user.mailing_lists << MailingList.find_by_name("Promotions")
      else
        flash[:notice] = "Address not added. It did not look like a valid address, or has already been used. Please try again."
      end
    end
    redirect_to :back
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
