# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

words = %w(bamboozled bazinga bevy bifurcate bilirubin bobolink buccaneer bulgur bumfuzzle canoodle cantankerous carbuncle caterwaul cattywampus cheeky conniption coot didgeridoo dingy doodle doohickey eschew fiddledeedee finagle flanker floozy fungible girdle gobsmacked grog gumption gunky hitherto hoi polloi hornswoggle hullabaloo indubitably janky kahuna katydid kerplunk kinkajou knickers lackadaisical loopy manscape monkey mugwump namby-pamby noggin pantaloons passel persnickety popinjay prestidigitation proctor rapscallion rookery rumpus scootch scuttlebutt shebang Shih Tzu smegma snarky snuffle spelunker spork sprocket squeegee succubus tater tuber tuchis viper waddle walkabout wasabi weasel wenis whatnot wombat wonky zeitgeist)

15.times.map do
  Drink.create!(name: words.sample(2))
end

50.times do
  drinks = Drink.all.sample(2)
  Vote.create!(best_presentation: drinks.sample.id, most_drinkable: drinks.sample.id, most_adventurous: drinks.sample.id)
end