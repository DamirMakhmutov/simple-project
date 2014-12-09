FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Some-post-#{n}" }
    text 'Some text'
    user
  end
end
