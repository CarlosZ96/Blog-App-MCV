# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    photo { 'path/to/photo.jpg' }
    bio { 'A short bio about the user.' }
    posts_counter { 0 }

    trait :with_posts do
      transient do
        posts_count { 3 }
      end

      after(:create) do |user, evaluator|
        create_list(:post, evaluator.posts_count, user:)
      end
    end
  end
end
