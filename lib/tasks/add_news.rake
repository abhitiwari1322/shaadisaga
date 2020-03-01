desc "Adding 100 news"
task :addNews => [:environment] do
    require 'rubygems'
    require 'faker'
    #require 'activerecord'
    100.times do
        News.create(
            title: Faker::Lorem.words(number: rand(2..10)).join(' '),
            description: Faker::Lorem.paragraphs(number: rand(2..8)).join('\n'),
            created_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
            updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)

        )
    end
end