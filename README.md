# README

## System dependencies
  
### This was built on a Mac and has not been tested on other platforms

* Ruby 3.1.2
 
* Rails  7.0.4.2
 
* Tailwind 2.0.23
 
* SQLite 3.36

## To get up and running

### Clone the git repo, open a shell and run the following commands:

To install the ruby gems

`bundle install`

To set up the database

`rails db:migrate`

Import the data

`rake demo_import:import`

To start the server

`rails server`

The demo should be available at localhost:3000

To run the test suite

`bundle exec rspec`

## Other userful commands

* `rails db:create`                          # Creates the database

* `rails db:drop`                            # Drops the database

* `rails db:migrate`                         # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)

* `rails db:reset`                           # empty all the database tables

You call also start the webserver with

* foreman start -f Procfile.dev

Which should allow you to change front end code and have it recompile
