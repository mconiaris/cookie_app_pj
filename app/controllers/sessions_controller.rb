class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(user_path(user))
    else
      flash[:error] = "Incorrect username or password."
      redirect_to(login_path)
    end
  end

  def destroy
    # actually do the log out information here...
    session[:user_id] = nil
    
    # redirect to wherever we go when we log out
    redirect_to(login_path)
  end
end