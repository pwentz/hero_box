# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
hero = Hero.create(:name => Faker::Superhero.name, :password => 'password', :hometown => Faker::Address.city)
hero_two = Hero.create(:name => Faker::Superhero.name, :password => 'password', :hometown => Faker::Address.city)
hero_three = Hero.create(:name => Faker::Superhero.name, :password => 'password', :hometown => Faker::Address.city)
hero_four = Hero.create(:name => Faker::Superhero.name, :password => 'password', :hometown => Faker::Address.city)
hero_five = Hero.create(:name => Faker::Superhero.name, :password => 'password', :hometown => Faker::Address.city)

15.times do |hero|
  Hero.create(:name => Faker::Superhero.name, :password => 'password', :hometown => Faker::Address.city)
end
cost = 0
Power.create(:name => 'Invisibility', :cost => 5, :image_url => "http://cdn1.listovative.com/wp-content/uploads/2014/08/Invisibility-300x300.jpg")
Power.create(:name => 'Underwater Breathing', :cost => cost += 3, :image_url => "http://vignette3.wikia.nocookie.net/powerlisting/images/b/bd/Namor2.jpg/revision/latest?cb=20110906182916")
Power.create(:name => 'Gliding', :cost => cost += 3, :image_url => "http://www.wishingmoon.com/wp-content/uploads/2016/07/superpowers.jpg")
Power.create(:name => 'Shapeshifting', :cost => cost += 3, :image_url => "https://s-media-cache-ak0.pinimg.com/236x/2e/17/8c/2e178cb2666245c612776b8ca515c7e4.jpg")
Power.create(:name => 'Weapon-based powers', :cost => cost += 3, :image_url => "https://s-media-cache-ak0.pinimg.com/564x/80/15/93/8015933c8a7f30179e17cc290ceb6c81.jpg")
Power.create(:name => 'Heat Generation', :cost => cost += 3, :image_url => "http://vignette2.wikia.nocookie.net/powerlisting/images/1/1e/Aang_Training_Fire.png/revision/latest?cb=20101008050558")
Power.create(:name => 'Duplication', :cost => cost += 3, :image_url => "http://static8.comicvine.com/uploads/scale_small/2/29837/2524996-duplicategirl_duplicating.jpg")
Power.create(:name => 'Electricity Manipulation', :cost => cost += 3, :image_url => "http://vignette4.wikia.nocookie.net/powerlisting/images/6/69/Cole_Macgrath.jpg/revision/latest/scale-to-width-down/320?cb=20130101082611")
Power.create(:name => 'Mind Control', :cost => cost += 3, :image_url => "http://vignette4.wikia.nocookie.net/powerlisting/images/8/8c/Professor_X_by_JJusko.jpg/revision/latest/scale-to-width-down/300?cb=20130206003656")
Power.create(:name => 'Rainbow Beams', :cost => cost += 3, :image_url => "http://static4.comicvine.com/uploads/square_small/6/68065/2293921-subs014.jpg")

14.times do
  hero.stopped_crimes.create(:crime => Faker::Hacker.ingverb, :potential_victim => Faker::Name.name, :location => Faker::Address.city)
end

5.times do
  hero_two.stopped_crimes.create(:crime => Faker::Hacker.ingverb, :potential_victim => Faker::Name.name, :location => Faker::Address.city)
end

hero_two.stopped_crimes.redeem_for_purchase(Power.find_by(:name => 'Underwater Breathing'))


8.times do
  hero_three.stopped_crimes.create(:crime => Faker::Hacker.ingverb, :potential_victim => Faker::Name.name, :location => Faker::Address.city)
end

hero_three.stopped_crimes.redeem_for_purchase(Power.find_by(:name => 'Gliding'))


hero_four.stopped_crimes.create(:crime => Faker::Hacker.ingverb, :potential_victim => Faker::Name.name, :location => Faker::Address.city)
hero_four.stopped_crimes.create(:crime => Faker::Hacker.ingverb, :potential_victim => Faker::Name.name, :location => Faker::Address.city)


10.times do
  hero_five.stopped_crimes.create(:crime => Faker::Hacker.ingverb, :potential_victim => Faker::Name.name, :location => Faker::Address.city)
end
hero_five.stopped_crimes.redeem_for_purchase(Power.find_by(:name => 'Shapeshifting'))
