# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tours = Tour.create([{name:'SNST Winter 2017',start_date: Date.today,end_date: Date.today+15},{name:'SNST Spring 2018',start_date: Date.today+60,end_date: Date.today+90}])
tour = tours.first
#venues = Venue.create([{name: 'Bob\'s Joint'},{name: 'High dive'}])

20.times do |ind|
	p "in loop"
	venue_name = 'venue num '+ind.to_s
	ven = Venue.create(name:venue_name)
	p ven

	day_num = Date.today+ind
	day = Day.create(date:day_num, tour_id: tour.id)
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

