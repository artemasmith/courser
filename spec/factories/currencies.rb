FactoryGirl.define do
  factory :currency do
    name 'USD'
    sequence(:value) { (10 + rand(100)).to_s }
  end
end