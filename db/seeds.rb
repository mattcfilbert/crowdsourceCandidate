# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

District.destroy_all
Zipcode.destroy_all

one = District.create(name: "The fightin' 1st", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Virginia_US_Congressional_District_1_%28since_2013%29.tif/lossless-page1-400px-Virginia_US_Congressional_District_1_%28since_2013%29.tif.png")
perry = one.candidates.create(name: "Perry", party: "Perrycrat")
