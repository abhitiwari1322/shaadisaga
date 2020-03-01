# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 2.5.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Design and Implementation

Tables: 
1. users
2. news
3. user_news

Table "user_news" contains fields as 
1. user_id
2. news_id
3. is_read = true if user marks a news as read 
4. is_deleted = true if user marks a news as is_deleted

Every time a user marks a news as read/deleted, we search for a record with corresponding user_id and news_id.
If record is found then we update with the choice(marked/deleted) as made by user or we create a new record.

There are two tasks to populate the database tables as 
1. add_news.rake  => to populate news table
2. add_users.rake  => to populate users table

Execute command : 
1. bundle exec rake addNews     (to run the task add_news.rake )
2. bundle exec rake addUsers     (to run the task add_users.rake )

Starting URL:
1. http://localhost:3000/news
2. It will ask for the user_id. Give it as query params e.g. 
http://localhost:3000/news?user_id=2

