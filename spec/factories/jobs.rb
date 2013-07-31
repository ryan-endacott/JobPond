# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    title "MyString"
    description "MyString"
    pay "9.99"
    employer_id 1
    address '100 Mainstreet Street'
    city 'Nixa'
    state 'Missouri'
  end
end
