class AdminController < ApplicationController

  layout "application", :except => [:login, :logout]

  def login
    
    if request.post?
      user = Usuario.authenticate(params[:login], params[:password])
      #user =Usuario.acts_as_authentic
      
      if user
        session[:user_id] = user.id
        redirect_to(:controller => "pessoas")
      else
        flash[:notice] = "Invalid user/password combination"
     end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end
end
