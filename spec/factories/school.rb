FactoryBot.define do
  factory :school do
    name { "school_1" }
    email { "school_1@mail.com" }
    pitch {"school_1" }
    subdomain { Faker::Internet.slug }
  end
end

