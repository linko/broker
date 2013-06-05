FactoryGirl.define do
  factory :car do
    brand           { Faker::Lorem.word }
    name            { Faker::Lorem.word }
    car_type        { Car.car_type.values.sample }
    engine_volume   { rand(1400) + 1200 }
    production_year { rand(30)   + 1980 }
  end

end
