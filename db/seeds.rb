# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

User.destroy_all
Book.destroy_all

rui = User.new(
  username: "Rui Borges",
  password: "123456",
  email: "rui@gmail.com"
)

rui.save!


# Delete all attached photos
Book.all.each do |book|
  book.photo.purge
end

book = Book.new(
  title: "Billy Summers",
  author: "Stephen King",
  year: "2021",
  rating: 4,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684402551/development/lc6bs9vv6x118bqmd1x3e0qh8szc.jpg")
book.photo.attach(io: file, filename: "billy.jpg", content_type: "image/png")
book.save!

book = Book.new(
  title: "Where the Crawdads Sing ",
  author: "Delia Owens",
  year: "2018",
  rating: 2,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684401887/development/7ycga7es2e6m5y9pq2w8tmbxi5j9.jpg")
book.photo.attach(io: file, filename: "crawdads.jpg", content_type: "image/png")
book.save!

book = Book.new(
  title: "The Anomaly",
  author: "Hervé le Tellier",
  year: "2021",
  rating: 1,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684402349/development/dzvcyx0xdx175vrjp9xbnxzlbuno.jpg")
book.photo.attach(io: file, filename: "anomaly.jpg", content_type: "image/png")
book.save!

book = Book.new(
  title: "Thinking Fast and Slow",
  author: "Daniel Kahneman",
  year: "2021",
  rating: 5,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684422455/development/tqkokga0trzf95lu548glqcdavvq.jpg")
book.photo.attach(io: file, filename: "anomaly.jpg", content_type: "image/png")
book.save!
