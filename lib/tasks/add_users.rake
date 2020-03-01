desc "Adding 50 users"
task :addUsers => [:environment] do
    require 'rubygems'
    require 'faker'
    #require 'activerecord'
    50.times do
        User.create(
            name: Faker::Name.unique.name,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.phone_number
        )
    end
end