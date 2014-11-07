FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words(rand(3..8)).join }
    body { Faker::Lorem.paragraphs(rand(3..8)).join }
    watch_count { rand(1..20) }
    author
  end

  factory :comment do
    body { Faker::Lorem.paragraphs(rand(3..8)).join }
    post
    author
  end

  factory :user, aliases: [:author] do
    name { Faker::Name.name }
  end
end
