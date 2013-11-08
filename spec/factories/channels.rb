# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :channel do
    name "MyString"
    short_name "MyString"
    free_or_pay "MyString"
    xmltv_id "MyString"
    black_flag false
  end
end
