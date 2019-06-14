class OrderMailer < ApplicationMailer
  
  def order_email
    @order = params[:order]
    @url = 'http://localhost:3000/'
    mail(to: @order.email, subject: 'Thanks for ordering from the Jungle: @order.id')
  end
end
