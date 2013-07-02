# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

# Only add these insecure seeds in development.
if Rails.env.development?
  puts 'Seeding database with default users:'
  puts 'Default Employer: employer'
  puts 'Default Employee: employee'
  puts 'Default Admin: admin'
  puts 'Default email: name@example.com'

  pass = 'helloworld'
  puts "Password for all of the above: #{pass}"

  Admin.find_or_create_by_email(
    :name => 'admin',
    :email => 'admin@example.com',
    :password => pass,
    :password_confirmation => pass)

  Employer.find_or_create_by_email(
    :name => 'employer',
    :email => 'employer@example.com',
    :password => pass,
    :password_confirmation => pass)

  Employee.find_or_create_by_email(
    :name => 'employee',
    :email => 'employee@example.com',
    :password => pass,
    :password_confirmation => pass)

end

# Add the secure admin in all environments.
admin = Admin.find_or_create_by_email(
  :name => ENV['ADMIN_NAME'].dup,
  :email => ENV['ADMIN_EMAIL'].dup,
  :password => ENV['ADMIN_PASSWORD'].dup,
  :password_confirmation => ENV['ADMIN_PASSWORD'].dup)
