# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding restaurants..."

Restaurant.destroy_all

restaurants = [
  { name: "Great Wall", address: "123 Dragon St, Chinatown", phone_number: "123-456-7890", category: "chinese" },
  { name: "Luigis Trattoria", address: "456 Pasta Ave, Little Italy", phone_number: "234-567-8901", category: "italian" },
  { name: "Sakura Sushi", address: "789 Sakura Blvd, Tokyo Town", phone_number: "345-678-9012", category: "japanese" },
  { name: "Chez Pierre", address: "101 Baguette Rd, Paris", phone_number: "456-789-0123", category: "french" },
  { name: "Brussels Bistro", address: "202 Waffle Ln, Brussels", phone_number: "567-890-1234", category: "belgian" }
]


created_restaurants = Restaurant.create!(restaurants)

puts "Finished! Created #{Restaurant.count} restaurants."

puts "Seeding reviews..."

review_texts = [
  "Amazing food and great atmosphere!",
  "Service was a bit slow, but food was worth the wait.",
  "Would definitely come back again!",
  "Not my favorite, but okay for a quick bite.",
  "Exceptional experience from start to finish."
]


created_restaurants.each_with_index do |restaurant, index|
  Review.create!(
    content: review_texts[index],
    rating: rand(1..5),
    restaurant: restaurant
  )
end


puts "Finished! Created #{Review.count} reviews."
