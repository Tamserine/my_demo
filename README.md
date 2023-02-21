# README

* System dependencies
This was built on a mac and has not been tested on other platforms

 Ruby 3.1.2
 Rails  7.0.4.2
 Tailwind 2.0.23
 and sqlite3
 
Clone the Git Repo and then:

To get the ruby gems
`Bundle Install`

To set up the Database
`Rails db:migrate`

Import the Data
`Rake demon_import import`

To start the server
`Rails server`

The demo should be available at localhost:3000

To run the test suite

`bundle exec rspec`

* Other userful Database commands

`rails db:create`                          # Creates the database
`rails db:drop`                            # Drops the database
`rails db:migrate`                         # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
`rails db:reset`                           # emmpty all the database tables

You call also start the webserver with

foreman start -f Procfile.dev

Which should allow you to change front end code and have it recompile
