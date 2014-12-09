FactoryGirl.define do
  factory :comment do
    text 'Some text'
    user
    post
  end
end
