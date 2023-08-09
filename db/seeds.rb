
# Create categories (if applicable)
vegetables = Category.create!(name: 'Vegetables')
meat = Category.create!(name: 'Meat')
# Create sellers
seller1 = Seller.create!(
  name: 'john',
  profile_pic: 'https://i.pinimg.com/564x/11/f8/3f/11f83f048f74b6548af28df643496532.jpg',
  contacts: '0277187387',
  location: 'Kajiado'
)
seller2 = Seller.create!(
  name: 'luccyy2',
  profile_pic: 'https://i.pinimg.com/564x/a2/81/df/a281dfb618363d660167cb8e98f2a754.jpg',
  contacts: '0986859597',
  location: 'NYC'
)
# Create products associated with sellers and categories
product1 = seller1.products.create!(
  name: 'Green Apple',
  description: 'Fresh green apple',
  price: 0.99,
  image: 'https://i.pinimg.com/564x/f7/32/2c/f7322cca82c1b67a36a53647e6139c17.jpg',
  category: vegetables
)
product2 = seller2.products.create!(
  name: 'Pawpaw',
  description: 'Sweet and juicy pawpaw',
  price: 2.49,
  image: 'https://i.pinimg.com/564x/65/99/9c/65999c55c5e3ff77a75086569c31901e.jpg',
  category: vegetables
)
product3 = seller1.products.create!(
  name: 'Drumsticks',
  description: 'Sweet and juicy 5 piecer chicken legs yummmmmyyy',
  price: 200.49,
  image: 'https://i.pinimg.com/564x/61/f2/9e/61f29e5401086ea570a319b77bf32a1b.jpg',
  category: meat
)
require 'faker'
users = []
10.times do
  user = User.create!(
    name: Faker::Name.unique.name,
   email: Faker::Internet.unique.email,
    password: 'password',
    contacts: Faker::PhoneNumber.cell_phone,
    user_type: 'customer',
    username: Faker::Internet.unique.username,
    role: 'user' # Default role for regular users
 )
  users << user
end

# Seed Orders and Order Items
 # Create an array of users

# users.each do |user|
#   order = Order.create!(
#     user: user,
#     order_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
#     total_amount: 0
#   )

#   total_amount = 0

#   rand(1..5).times do
#     product = products.sample
#     quantity = rand(1..5)
#     subtotal = product.price.to_f * quantity
#     order.order_items.create!(
#       quantity: quantity,
#       subtotal: subtotal,
#       product: product
#     )
#     total_amount += subtotal
#   end

#   order.update(total_amount: total_amount)
# end



