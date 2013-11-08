# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :program do
    title "MyString"
    subtitle "MyString"
    region_id 1
    sport_id 1
    channel_id 1
    category "MyString"
    description "MyString"
    start_datetime "2013-11-04 22:23:41"
    end_datetime "2013-11-04 22:23:41"
  end
end
