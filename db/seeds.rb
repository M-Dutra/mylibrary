# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Book.destroy_all
User.destroy_all

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
  title: "Prisioners of Geography",
  author: "Tim Marshall",
  year: "2015",
  rating: 4,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684428039/jpnciroltr5ltwuabzbo.jpg")
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
  title: "All the Ligh We Cannot See",
  author: "Anthony Doerr",
  year: "2014",
  rating: 5,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684428578/kwpn8hgab5wyxiowkm8i.jpg")
book.photo.attach(io: file, filename: "anomaly.jpg", content_type: "image/png")
book.save!

book = Book.new(
  title: "Thinking Fast and Slow",
  author: "Daniel Kahneman",
  year: "2021",
  rating: 3,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684422455/development/tqkokga0trzf95lu548glqcdavvq.jpg")
book.photo.attach(io: file, filename: "anomaly.jpg", content_type: "image/png")
book.save!

book = Book.new(
  title: "God Emperor of Dune",
  author: "Frank Herbert",
  year: "1981",
  rating: 4,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684582045/xtes2kcpqoaj0wlddemb.jpg")
book.photo.attach(io: file, filename: "dune3.jpg", content_type: "image/png")
book.save!

book = Book.new(
  title: "The Underground Railroad",
  author: "Colson Whitehead",
  year: "2016",
  rating: 3,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684485721/ihstfo6ckpbrzyfnrkui.jpg")
book.photo.attach(io: file, filename: "railroad.jpg", content_type: "image/png")
book.save!


book = Book.new(
  title: "The Old Man and the Sea",
  author: "Ernest Hemingway",
  year: "1954",
  rating: 3,
  user_id: rui.id
)

file = URI.open("https://res.cloudinary.com/dkax3m0du/image/upload/v1684484349/lnyju9uvs3rhosxnoiko.jpg")
book.photo.attach(io: file, filename: "hemingway.jpg", content_type: "image/png")
book.save!


book = Book.new(
  title: "Testing Default Picture",
  author: "Manuel Dutra",
  year: "2001",
  rating: 1,
  user_id: rui.id
)

book.save!
