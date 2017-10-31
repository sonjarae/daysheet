# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tours = Tour.create([{name:'SNST Winter 2017',start_date: Date.today,end_date: Date.today+15},{name:'SNST Spring 2018',start_date: Date.today+60,end_date: Date.today+90}])
#tours = Tour.all
tour = tours.first
tour2 = tours.second
venues = Venue.create([{name: 'Bob\'s Joint'},{name: 'High dive'}])
#venues = Venue.all
venue = venues.first
venue2 = venues.second
day = Day.create(date: 1.month.from_now, tour_id: tour.id, venue_id: venue.id)
incomes = Income.create(tour_name:tour.name, guarantee:300, day_id:day.id)

#schedules = Schedule.create(load_in_time: DateTime.now)
