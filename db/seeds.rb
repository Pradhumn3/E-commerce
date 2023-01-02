# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  admin = AdminUser.find_or_initialize_by(email: 'admin@example.com').tap do |a|
    a.password = 'password'
    a.password_confirmation = 'password'
    a.save
  end
end

user = User.find_or_initialize_by(email: 'example@ecommerce.com').tap do |u|
  u.name = 'example'  
  u.email = 'example@ecommerce.com'
  u.password = 123456
  u.phone_no = 9000900090
  u.save
end

address = user.addresses.create!(house_no: "159/1", land_mark: "Near hostpital", area:"rajaram Nagar", city:"Indore")

8.times do |i|
  product = Product.find_or_create_by!(name: "Ecom-10#{i}", description: "This is Sample product", price: 2000, quantity: 10)
  product.image.attach(
    io: File.open('app/assets/images/jack.jpg'),
    filename: 'jack.jpg'
    )
end
