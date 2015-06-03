class SessionsController < ApplicationController
  def create
    authorized_user = Account.from_omniauth(env["omniauth.auth"])
      session[:logged_in] = true
      session[:user_id] = authorized_user.id
      session[:email] = authorized_user.email
      session[:name] = authorized_user.display_name
      
      session[:picture] = authorized_user.images.profile_pic.first.url
      flash[:notice] = "You are now logged in."
      redirect_to(:controller => 'topics', :action =>'index')
    
  end
  def test
    
  end
  def destroy
    session[:logged_in] = false
    session[:user_id] = nil
    redirect_to root_url
  end
  
 


end