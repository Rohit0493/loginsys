class SessionController < ApplicationController
	skip_before_action :authorize

  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		sessions[:user_id] = user.user_id
  		redirect_to admin_url
  	else
  		redirect_to login_url, alert: "Invalid Username or Password"	
    end  
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert:"Successfully Logged Out"
  end
end
