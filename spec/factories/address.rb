FactoryBot.define do
  factory :address, class: 'Address' do
    house_no { "159" }
    area { "Vijay Nagar" }
    land_mark {"Near XH hospital"}
    city {"Indore"}
    association :user
  end
end
