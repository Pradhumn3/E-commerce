class RazorpayServices
  require "razorpay"
  Razorpay.setup('rzp_test_h9jGArkwI1lRsW', 'vNN93Ag2CiKJ199pA8e2gfKW')

  def self.create_order(amount)
    @amount = amount
    order = Razorpay::Order.create amount: @amount, currency: 'INR', receipt: 'TEST'
  end
end