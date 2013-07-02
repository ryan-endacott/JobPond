# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end

  factory :employee, class: Employee do
  	name "Employee"
  	email "employee@example.com"
  	password "password"
  	password_confirmation "password"
  end

  factory :employer, class: Employer do
  	name "Employer"
  	email "employer@example.com"
  	password "password"
  	password_confirmation "password"
    confirmed_at Time.now
  end

  factory :admin, class: Admin do
  	name "Admin"
  	email "employer@example.com"
  	password "password"
  	password_confirmation "password"
  end
end
