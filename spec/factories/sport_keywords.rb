# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sport_keyword do
    rule_type "MyString"
    value "MyString"
    sport_id 1
    priority 1
  end
end
