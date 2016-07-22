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
    role 0
  end

end
