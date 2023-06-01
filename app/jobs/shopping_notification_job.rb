class ShoppingNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.all.each do |user|
      ShopingMailer.send_mail(user).deliver_now
    end
  end
end
