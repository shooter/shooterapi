require 'machinist/active_record'
require 'sham'
require 'faker'

Sham.name  { Faker::Name.name }
Sham.url { Faker::Internet.domain_name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }
Sham.date { Time.now }
Sham.code { Faker::Lorem.words.first }
Sham.price { (1..100).to_a.rand }
Sham.password { Faker::Company.bs }
Sham.content { Faker::Lorem.sentence }

User.blueprint do
  email
  password
end

Shooter.blueprint do
  name
end

Muffler.blueprint do
  pattern { Sham.name }
end

Webhook.blueprint do
  url
end