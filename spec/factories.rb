FactoryGirl.define do

  factory :stopped_crime do
    potential_victim { Faker::Name.name }
    location { Faker::Address.city }
    crime { Faker::Hacker.ingverb }
    criminal { Faker::Book.author }
    hero
  end

  factory :hero do
    name { Faker::Superhero.name }
    hometown { Faker::Address.city }
    password { Faker::Internet.password }
    image_url { Faker::Avatar.image }
    role 0
  end

  factory :power do
    name { Faker::Superhero.power }
    cost 
  end

  sequence :cost do |n|
    n + 5
  end
end
