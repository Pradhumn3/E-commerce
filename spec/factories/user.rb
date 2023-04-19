FactoryBot.define do
  factory :user, class: 'User' do
    email { "E-com#{rand.to_s[2..9]}@gmail.com" }
    password { "123456" }
    name { "Vijay Nagar" }
    phone_no {"9874561230"}
    razorpay_customer_id {"cust_Ky7VrxBmhxfzOo"}
  end
end