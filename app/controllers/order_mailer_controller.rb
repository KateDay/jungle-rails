class OrderMailerController < ApplicationController
  
  def run
    Order.find_each do |user|
      UserMailer.with(user: user).order_email.deliver_now
    end
  end
end
