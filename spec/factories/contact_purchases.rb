# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact_purchase, :class => 'ContactPurchases' do
    employer nil
    employee nil
    charge_id "MyString"
    refunded false
  end
end
