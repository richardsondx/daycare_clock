# README

This app is a simple application that allow a user to log in as an employee and clock in/out 

* Ruby version

ruby-2.5.1

* System dependencies

There are no major system depencies other than 
- Postgresql for the database
- and an Environment file

* Configuration


You'll need to set the ENVIRONMENT VARIABLES:

Copy the .env.sample file to get started 

`
$ cp .env.sample .env
`

* Database creation

Run the migration to create the database

`
rake db:migrate
`
* Database initialization

rake db:create

* How to run the test suite

This application is using Minitest

To start the test suite run:

`
$ rake test
`

Test coverage are located at app/coverage

* Services (job queues, cache servers, search engines, etc.)

To start postgres 

Type 

`
$ brew service start postgres
`

Or use the postgresapp ( easier )

https://postgresapp.com/

* Deployment instructions

This project is deployed using Heroku

Refer to https://devcenter.heroku.com/categories/deployment for details