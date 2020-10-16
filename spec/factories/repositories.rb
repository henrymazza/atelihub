FactoryBot.define do
  factory :repository do
    language

    name { Faker::Internet.domain_name }

    owner { { 'avatar_url' => '' } }
    details { { 'forks' => rand(1000) } }
    readme { { 'name' => 'README.txt' } }
  end
end
