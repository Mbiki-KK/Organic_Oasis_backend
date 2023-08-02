require 'faker'

# Fetch all existing category and user IDs
category_ids = Category.pluck(:id)
user_ids = User.pluck(:id)

# Generate fake data for products
20.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    desc: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Commerce.price(range: 5..100.0),
    availability: Faker::Boolean.boolean(true_ratio: 0.8) # 80% chance of being available
    # Add any other product attributes you have in your Product model
  )
end
