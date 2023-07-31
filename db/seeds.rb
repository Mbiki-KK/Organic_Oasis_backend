require 'faker'


if Rails.application.config.x.seed_data
  # Your existing seed data code here
  # Seed Categories
categories = []
5.times do
  categories << Category.create!(
    name: Faker::Food.unique.fruits,
    desc: Faker::Food.description
  )
end

# Seed Users and Addresses
# Seed Users and Addresses
require 'faker'

# Seed Categories
# ...

# Seed Users
require 'faker'

# Seed Categories
# ...

# Seed Users
users = []

10.times do
  user = User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    contacts: Faker::PhoneNumber.cell_phone,
    user_type: 'customer',
    username: Faker::Internet.unique.username,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    postal_code: Faker::Address.zip_code,
    role: 'user' # Default role for regular users
  )

  users << user
end

# Seed Sellers
sellers = []

2.times do
  seller = User.create!(
    name: Faker::Name.unique.name,
    email: Faker::Internet.unique.email,
    password: 'password',
    contacts: Faker::PhoneNumber.cell_phone,
    user_type: 'customer',
    username: Faker::Internet.unique.username,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    postal_code: Faker::Address.zip_code,
    role: 'seller'
  )

  sellers << seller
end

# Seed Products
products = []
20.times do
  product = Product.create!(
    name: Faker::Food.unique.vegetables,
    desc: Faker::Food.description,
    price: Faker::Number.decimal(l_digits: 2),
    availability: 'In stock',
    user: sellers.sample # Associate the product with a random seller
  )

  products << product
end

# Seed Reviews
reviews = []
50.times do
  review = Review.create!(
    comment: Faker::Restaurant.review,
    review_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    user: users.sample,
    product: products.sample
  )

  reviews << review
end

# Seed Orders and Order Items
users.each do |user|
  order = Order.create!(
    user: user,
    order_date: Faker::Date.between(from: 1.year.ago, to: Date.today),
    total_amount: 0 # The actual total amount will be calculated based on order items
  )

  total_amount = 0 # Initialize the total_amount variable

  rand(1..5).times do
    product = products.sample
    quantity = rand(1..5)
    subtotal = product.price * quantity
    order.order_items.create!(
      quantity: quantity,
      subtotal: subtotal,
      product: product
    )
    total_amount += subtotal # Update the total_amount for each order item
  end

  order.update(total_amount: total_amount) # Update the total_amount for the order
end
end
