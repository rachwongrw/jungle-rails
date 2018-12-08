class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_confirmation(order)
    @order = order
    mail(to: @order.email, subject: "Order ##{@order.id} confirmed.")
  end

end
