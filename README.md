# simplelogin

## Running locally

Prerequisites: ruby 2.2

1. Run `bundle install` to install dependencies
2. Setup your local DB with `rake db:setup`. Sqlite is the default db for development. If you'd like to use an alternate DB (MySQL, Postgres, etc.), update your db settings in database.yml
3. Run the server with `rails s`
4. Navigate to `http://localhost:3000`

## Running tests

1. Run `rspec` from project root to run the test suite
