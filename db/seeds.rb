require "faker"




# Helper method to generate a random date within a specified range
def random_date(from: 1.year.ago, to: Time.current)
  rand(from..to)
end

# Helper method to generate a random price within a specified range
def random_price(min: 1, max: 20)
  rand(min..max).round(2)
end

# Helper method to generate a random quantity within a specified range
def random_quantity(min: 5, max: 100)
  rand(min..max)
end

# Create some categories using faker
10.times do
  Category.create!(
    name: Faker::Food.unique.ingredient,
    desc: Faker::Food.description
  )
end

# Create someUser (farmers and buyers)
users = [
  { name: "John Doe (Farmer)", email: "john@example.com", password: "password", contacts: "123-456-7890", address: "Farm Address 1", user_type: "Farmer" },
  { name: "Jane Smith (Buyer)", email: "jane@example.com", password: "password", contacts: "987-654-3210", address: "123 Main St, City", user_type: "Buyer" }
]

User.create!(users)

# Create some products using faker
categories = Category.all
20.times do
  Product.create!(
    name: Faker::Food.unique.dish,
    desc: Faker::Food.description,
    price: random_price,
    availability: ["In Season", "In Stock"].sample,
    category: categories.sample,
    seller_id:User.find_by(name: "John Doe (Farmer)").id
  )
end

# Create some orders and order items
orders = [
  { user_id:User.find_by(name: "Jane Smith (Buyer)").id, order_date: random_date, total_amount: random_price },
  { user_id:User.find_by(name: "Jane Smith (Buyer)").id, order_date: random_date, total_amount: random_price }
]

Order.create!(orders)

# Create order items for each order
orders.each do |order|
  products = Product.all.sample(5)
  products.each do |product|
    OrderItem.create!(quantity: random_quantity, subtotal: product.price * random_quantity, order_id: order.id, product_id: product.id)
  end
end

# Create some reviews
reviews = [
  { comment: "Delicious!", review_date: random_date, user_id:User.find_by(name: "Jane Smith (Buyer)").id, product_id: Product.first.id },
  { comment: "Fresh and tasty!", review_date: random_date, user_id:User.find_by(name: "Jane Smith (Buyer)").id, product_id: Product.second.id },
  { comment: "Great quality!", review_date: random_date, user_id:User.find_by(name: "Jane Smith (Buyer)").id, product_id: Product.third.id },
]

Review.create!(reviews)

