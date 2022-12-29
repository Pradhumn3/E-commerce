class RazorpayServices
  require "razorpay"
  Razorpay.setup('rzp_test_vTgfIDIOx2szl2', 'peaV1I4tadzKLev5ro8BYGqy')
  class << self
    def create_order(amount)    
      @amount = amount
      order = Razorpay::Order.create amount: @amount, currency: 'INR', receipt: 'TEST'
    end
  
    def verify_payment_status(payment_response)
      Razorpay::Utility.verify_payment_signature(payment_response)
    end
  end
end