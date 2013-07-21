# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  #before_filter :authorize, :except => [:login]
  #before_filter :require_user, :except => [:login]
  helper_method :current_user

  def authorize
    unless Usuario.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to login_url
    end
  rescue
    redirect_to login_url unless params[:controller] == 'ckeditor'
  end
end
