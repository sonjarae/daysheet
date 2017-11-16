# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

tours = Tour.create([{name:'SNST Winter 2017',start_date: Date.today,end_date: Date.today+15},{name:'SNST Spring 2018',start_date: Date.today+60,end_date: Date.today+90}])

venues = Venue.create([{name: 'Bob\'s Joint'},{name: 'High dive'}])

tour = tours.first
5.times do |ind|
	p "in loop"
	venue_name = 'venue num '+ind.to_s
	ven = Venue.create(name:venue_name)
	p ven

	day_num = Date.today+ind
	bus_call_str = day_num.to_s + " 09:00:00 +0100"
	hotel_call_str = day_num.to_s + " 23:00:30 +0100"

	day = Day.create(
		date: day_num, 
		tour_id: tour.id,
		city: "Chicago",
		bus_call_am: Time.parse(bus_call_str),
		bus_call_hotel: Time.parse(hotel_call_str),
		notes: "notes \n\n notes \n\n notes\n\n ",
		per_diem_exp: 20.00,
		gas_exp: 25.00,
		hotel_exp: 90.00,
		other_expenses: 50.00
	)

	p day

	show_status = ''
	p "getting show status"
	if ind<10
		show_status = 'Confirmed'
	elsif ind<18
		show_status = 'Planned'
	else 
		show_status = 'Cancelled'
	end

	sch = Schedule.create(tour_id:tour.id, venue_id:ven.id, day_id:ind, show_number:ind, show_status: show_status)
	p sch
	inc = Income.create(tour_id:tour.id, guarantee:300, schedule_id:sch.id)
	p inc
end

tour = tours.second
3.times do |ind|

	venue_name = 'venue num '+ind.to_s
	ven = Venue.create(name:venue_name)
	p ven

	day_num = Date.today+ind
	bus_call_str = day_num.to_s + " 09:00:00 +0100"
	hotel_call_str = day_num.to_s + " 23:00:30 +0100"

	day = Day.create(
		date: day_num, 
		tour_id: tour.id,
		city: "Los Angeles",
		bus_call_am: Time.parse(bus_call_str),
		bus_call_hotel: Time.parse(hotel_call_str),
		notes: "notes \n\n notes \n\n notes\n\n ",
		per_diem_exp: 30.00,
		gas_exp: 35.00,
		hotel_exp: 100.00,
		other_expenses: 60.00
	)

	p day

	show_status = ''
	p "getting show status"
	if ind<10
		show_status = 'Confirmed'
	elsif ind<18
		show_status = 'Planned'
	else 
		show_status = 'Cancelled'
	end

	sch = Schedule.create(tour_id:tour.id, venue_id:ven.id, day_id:ind, show_number:ind, show_status: show_status)
	p sch
	inc = Income.create(tour_id:tour.id, guarantee:300, schedule_id:sch.id)
	p inc
end

