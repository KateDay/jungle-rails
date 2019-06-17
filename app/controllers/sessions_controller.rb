class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(login_params[:email])
    puts 'This is the user!!!!!', user
    puts 'This is the PassWord Params!!!!!', params['login'][:password]
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.alert = "I can't find that in my system, please try again"
      redirect_to'/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  def login_params
    params.require(:login).permit(
      :email,
      :password
    )
  end
end

