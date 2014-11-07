# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

extend FactoryGirl::Syntax::Methods

users = create_list(:user, 100)

1000.times do
  post = create(:post, author: users.sample)
  rand(2..30).times do
    create(:comment, post: post, author: users.sample)
  end
end
