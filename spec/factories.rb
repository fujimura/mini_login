FactoryGirl.define do

  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
  end

end
