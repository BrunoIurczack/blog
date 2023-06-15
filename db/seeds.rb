# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "bruno@gmail.com", password: "123456")

10.times do |i|
  Category.find_or_create_by!(
    name: "Category #{i}"
  )
end

50.times do |i|
  Post.find_or_create_by!(
    title: "bla bla #{i}",
    category: Category.find(rand(1..10)),
    resume: "ghghghghghghghghghghghghghghghghghghghghghgh",
    publication_date: Date.today,
    content: "shdjqlfajdbf ojahfnkajkshfijafh jahfneifhais ihisdahdshdjdklsndkasddsiadj jhasbsjbfasbkjsbkab" 
  )
end
