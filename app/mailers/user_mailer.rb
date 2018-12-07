class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_confirmation(email, order)
    @email = email
    @order = order
    mail(to: email, subject: "Order ##{@order.id} confirmed.")
  end

end
