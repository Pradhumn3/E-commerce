FactoryBot.define do
  factory :admin_user, class: 'AdminUser' do
    email { "Admin#{rand.to_s[2..9]}@gmail.com" }
    password { "123456" }
    password_confirmation { "123456" }
  end
end