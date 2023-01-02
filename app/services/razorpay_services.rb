class RazorpayServices
  require "razorpay"
  Razorpay.setup('rzp_test_vTgfIDIOx2szl2', 'peaV1I4tadzKLev5ro8BYGqy')
  # Razorpay.setup('rzp_test_KheZPJKthD8PeV', 'KkCcYBNS2YeOCK5acFeJbVzH')
  class << self
    def create_order(amount)    
      @amount = amount
      order = Razorpay::Order.create amount: @amount, currency: 'INR', receipt: 'TEST'
    end
  
    def verify_payment_status(payment_response)
      Razorpay::Utility.verify_payment_signature(payment_response)
    end

    def create_customer(user)
      Razorpay::Customer.create({
        "name": user.name,
        "contact": user.phone_no,
        "email": user.email,
        "fail_existing": 0,
      })
    end

    def create_plan(plan)
      para_attr = {
        "period": plan.period.downcase,
        "interval": plan.billing_cycle.to_i,
        "item": {
          "name": plan.plan_name,
          "amount": (plan.amount.to_i * 100),
          "currency": 'INR',
          "description": plan.description
        },
      }
      response = Razorpay::Plan.create(para_attr)
    end

    def create_subscription(plan, user)
      para_attr = {
        "plan_id": plan.razorpay_plan_id,
        # "customer_id": user.razorpay_customer_id,
        "customer_notify": 1,
        "total_count": 1,
        "addons": [
          {
            "item": {
              "name": "Delivery charges",
              "amount": plan.amount,
              "currency": "INR"
            }
          }
        ]
      }
      
      Razorpay::Subscription.create(para_attr)
    end
  end
end