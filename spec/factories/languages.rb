FactoryBot.define do
  factory :language do
    name { Faker::ProgrammingLanguage.name }

    trait :with_repositories do
      after(:create) do |language|
        create_list(:repository, 3, language: language)
      end
    end
  end
end
