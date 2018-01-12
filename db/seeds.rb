# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
#ActiveRecord::Base.connection.execute('ALTER TABLE products AUTO_INCREMENT = 1')

Product.create!(title: 'RB', description: 'LeanRB', price: 12.99, published: true)
Product.create!(title: 'JQ', description: 'LeanJQ', price: 11.99, published: true)
Product.create!(title: 'SASS', description: 'LeanCSS', price: 18.99, published: true)
Product.create!(title: 'TestHTML', description: '<div>This is HTML</div>', price: 11.99, published: true)
Product.create!(title: 'RB1', description: 'LeanRB1', price: 12.99, published: true)
Product.create!(title: 'RB2', description: 'LeanRB2', price: 12.99, published: true)