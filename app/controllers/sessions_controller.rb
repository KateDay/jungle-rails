class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[user_id] = user.id
      redirect_to '/'
    else
      redirect_to'login'
      flash[:notice] = "I can't find that in my system, please try again"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
