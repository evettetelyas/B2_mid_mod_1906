# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AuthorBook.destroy_all
Author.destroy_all
Book.destroy_all

dr_suess = Author.create(name: "Dr. Suess")
chuck = Author.create(name: "Chuck Palahkiuk")
cat = dr_suess.books.create(title: "Cat in the Hat", pages: 20, year: "1990")
pop = dr_suess.books.create(title: "Hop on Pop", pages: 30, year: "1995")
fight = chuck.books.create(title: "Fight Club", pages: 200, year: "1999")
survivor = chuck.books.create(title: "Survivor", pages: 240, year: "2005")
both = Book.create(title: "Two people wrote this", pages: 500, year: "2002", authors: [dr_suess, chuck])
