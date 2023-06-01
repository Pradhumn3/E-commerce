class ShopingMailer < ApplicationMailer
  def send_mail(user)
    @user = user
    mail(
      to: @user.email,
      from: "e-commerce@example.com", 
      subject: 'Knock! knock! Discount in your Door!'
    )
  end
end
