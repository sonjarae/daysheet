# README

* Ruby version
rvm use ruby-2.4.0

* System dependencies
run bundle install

* Configuration:  
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

* Database creation:
bundle exec rake db:create
`Created database 'daysheet_development'`
`Created database 'daysheet_test'`

* Database initialization
bin/rails db:migrate db:seed RAILS_ENV=development 

* Start the server:  rails s (ctrl + c to stop)

* Go to http://localhost:3000/ 

