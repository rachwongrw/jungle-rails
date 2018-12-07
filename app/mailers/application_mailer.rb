class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: 'Order #{@order.id} has been received.')
end
