class MailingListsController < ApplicationController
 
  def join_list
    if params[:signup] && params[:signup][:email]
      fake_user = User.new
      fake_user.password = fake_user.password_confirmation = "1234"
      fake_user.email = params[:signup][:email]
      if fake_user.valid?
        flash[:notice] = "Thank you. We will add <strong>#{params[:signup][:email]}</strong> to the offers newsletter."
      else
        flash[:notice] = "Address not added. It did not look like a valid address. Please try again."
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
