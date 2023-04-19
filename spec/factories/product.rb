FactoryBot.define do
  factory :product, class: 'Product' do
    name { "Product#{rand.to_s[2..9]}" }
    price { "2000" }
    quantity { 10 }
    description {"lorem lorem ipsum dolor sit amet"}
    association :category
  end
end