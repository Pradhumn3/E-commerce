class OrderMailer < ApplicationMailer
  def user_order(user,order)
    byebug
    @user = user
    @order = order
    mail(
      to: @user.email, 
      subject: 'Order has been Placed!'
    )
  end
end
