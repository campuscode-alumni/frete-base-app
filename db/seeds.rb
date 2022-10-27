# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.create(email: user@email.com, password:)
# Company.create(name: , cnpj: )
# Product.create(name: , price: , company:)
#User.create(email: user@email.com, password: )


product_category = ProductCategory.create!(name: "Eletrônico")
product = Product.create!(name: "Celular", price: 2000, product_category: product_category)



