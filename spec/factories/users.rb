# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name "User"
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end

  factory :employee, class: Employee do
  	first_name 'Test'
    last_name "User"
  	email "employee@example.com"
  	password "password"
  	password_confirmation "password"
  end

  factory :employer, class: Employer do
  	first_name 'Test'
    last_name "User"
  	email "employer@example.com"
  	password "password"
  	password_confirmation "password"
    confirmed_at Time.now
  end

  factory :admin, class: Admin do
  	first_name 'Test'
    last_name "User"
  	email "employer@example.com"
  	password "password"
  	password_confirmation "password"
  end
end
