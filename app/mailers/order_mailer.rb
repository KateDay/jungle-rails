class OrderMailer < ApplicationMailer
  
  def welcome_email
    @order = params[:order]
    @user = params[:user]
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Thanks for ordering from the Jungle @order.id')
  end
end
