class MailingListsController < ApplicationController
  before_filter :require_no_user, :only => [:blank_join_list]

  # used to add dummy user to a specified list 
  def blank_join_list
    if params[:signup] && params[:signup][:email]
      pw = Digest::SHA1.hexdigest("--#{Time.now.to_s}#{self.object_id}#{Array.new(256){rand(256)}.join}")
      user = User.new
      user.password = user.password_confirmation = pw
      user.email = params[:signup][:email]
      user.name = user.email # only by default 

      if user.save_without_session_maintenance	# prevents auto-login
        #flash[:notice] = "We will add <strong>#{params[:signup][:email]}</strong> to the #{params[:signup][:list]} newsletter. #{params[:signup][:welcome]}"
        flash[:notice] = params[:signup][:welcome] 
        user.roles << Role.find_by_name("mail_list")
        user.mailing_lists << MailingList.find_by_name(params[:signup][:list])
      else
        flash[:notice] = "Email address not added. It did not look like a valid address, or has already been used. Please try again."
      end
    end
    redirect_back_or_default products_path
  end 
end

# NOTES/TODO
# could use to subscribe existing users - but be careful about role
