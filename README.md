# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby and Rails versions
    - Ruby 3.0.2
    - Rails 6.1.4.4

* System dependencies
    rails g rswag:specs:install
    rails g rswag:api:install
    rails g rswag:ui:install

* Configuration
    environmet variables:
        - ENV['REGRES_URL_ENDPOINT'] => Api url Regress

* Database creation
    sqlite3
        - rake db:drop db:create

* Database initialization
    sqlite3
        - rake db:migrate

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)
    Cron execution
        - path: config/initializers/scheduler.rb => "set trigger time in line 10, actually is set to 10s (10 seconds).

* Deployment instructions
    start Api
        - bundle install
        - database commands
        - rails s

* Postman Collection
    - Api v1 Users available in folder "Postman Collection"
