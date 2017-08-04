# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

one = District.create(name: "1st", img_url: "https://vignette3.wikia.nocookie.net/pokemon/images/b/b2/Charizard-GO.png/revision/latest?cb=20160809155022")
perry = one.candidates.create(name: "Perry", party: "Perrycrat")
Vote.create(reason: "He is dumb like me!", candidate: perry)
