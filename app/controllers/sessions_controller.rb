class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.auth(params[:username],params[:password])
      session[:user_id] = user.id
      session[:name] = user.name
      redirect_to tickets_url
    else
      redirect_to login_url, :alert => "Check your Username and Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :controller => "tickets", :notice => "Logged out"
  end

end
