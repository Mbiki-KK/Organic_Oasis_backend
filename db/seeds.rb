# data for each category product
# db/seeds.rb

# Create fake data for Meat
10.times do
  Meat.create(
    name: Faker::Food.meat,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Food.description
  )
end

# Create fake data for Beverage
10.times do
  Beverage.create(
    name: Faker::Drink.unique.beverage,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Food.description
  )
end

# Create fake data for Bakery
10.times do
  Bakery.create(
    name: Faker::Food.cake,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Food.description
  )
end

# Create fake data for Spices
5.times do
  Spices.create(
    name: Faker::Food.spice,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Food.description
  )
end

# Create fake data for Cereal
5.times do
  Cereal.create(
    name: Faker::Food.cereal,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Food.description
  )
end

# Create fake data for Dairy
5.times do
  Dairy.create(
    name: Faker::Food.dish,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Food.description
  )
end

# Create fake data for Offers
5.times do
  Offers.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Commerce.promotion
  )
end

# Create fake data for VeggiesAndFruits
5.times do
  VeggiesAndFruits.create(
    name: Faker::Food.fruits,
    price: Faker::Commerce.price(range: 1..100.0),
    image_url: Faker::Placeholdit.image,
    description: Faker::Food.description
  )
end























require 'faker'
# Clear existing data
OrderItem.delete_all
Order.delete_all
Review.delete_all
Product.delete_all
User.delete_all
Category.delete_all
# Seed Categories
categories = []
5.times do
  categories << Category.create!(
    name: Faker::Food.unique.fruits,
    desc: Faker::Food.description
  )
end
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
    user_type: 'seller',
    username: Faker::Internet.unique.username,
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
    category: categories.sample, # Associate the product with a random category
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
    subtotal = product.price.to_f * quantity
    order.order_items.create!(
      quantity: quantity,
      subtotal: subtotal,
      product: product
    )
    total_amount += subtotal # Update the total_amount for each order item
  end
  order.update(total_amount: total_amount) # Update the total_amount for the order
end
