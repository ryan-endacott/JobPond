# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reference do
    name "MyString"
    relationship "MyString"
    length_known "MyString"
    phone_number "MyString"
    email "MyString"
  end
end
