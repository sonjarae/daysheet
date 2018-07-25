# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'date'
require 'time'

tours = Tour.create([{name:'SNST Winter 2017',start_date: Date.today,end_date: Date.today+15},{name:'SNST Spring 2018',start_date: Date.today+60,end_date: Date.today+90}])

venues = Venue.create([
{name: 'Schubas(Chicago)', contact: 'Joe', email: 'joe@thejoint.com', address: '3159 N Southport Ave, Chicago, IL 60657', website: 'schubas.com'},
{name: 'Firebird(MO)', address: '2706 Olive St, St. Louis, MO 63103', website: 'firebird.com', contact: 'Mary', email: 'mary@firebirdmo.com'},
{name: 'Metro(Chicago)', address: '3730 N Clark St, Chicago, IL 60613', website: 'metrochicago.com', contact: 'Doug' },
{name: 'Bottom Lounge(Chicago)', address: '1375 W Lake St, Chicago, IL 60607', website: 'bottomlounge.com', contact: 'Brian Peterson' },
{name: 'Cowboy Monkey(Champaign)', address: '6 Taylor St, Champaign, IL 61820	', contact: 'John Isberg' },
{name: 'First Avenue (Minneapolis)', address: '701 N 1st Ave, Minneapolis, MN 55403'},
{name: 'Newport Music Hall(Colombus)', address: '1722 N High St, Columbus, OH 43201', website: 'newporthall.com', contact: 'Angela' },
{name: 'The Fillmore(Detroit)', address: '2115 Woodward Ave, Detroit, MI 48201', website: 'fillmore.com', contact: 'Dylan Richards' },
{name: 'The Echo(LA)', address: '1822 Sunset Blvd, Los Angeles, CA 90026', website: 'echoLA.com' },
{name: 'Culture Room (Fort Lauderdale)', address: '3045 N Federal Hwy, Fort Lauderdale, FL 33306'}
]) 

i = 0
tours.each do |t|
	i+=1
	day_num = Date.today+i
	bus_call_str = day_num.to_s + " 09:00:00 +0100"
	hotel_call_str = day_num.to_s + " 23:00:30 +0100"

	venues.each do |v|
		city_name = v.name.match(/\((.*)\)/)[1]
		day = Day.create(
			date: day_num,
			tour_id: t.id,
			city: city_name,
			bus_call_am: Time.parse(bus_call_str),
			bus_call_hotel: Time.parse(hotel_call_str),
			notes: "notes",
			per_diem_exp: 30.00,
			gas_exp: 35.00,
			hotel_exp: 100.00,
			other_expenses: 60.00
		)

		show_status = ''
		if i<10
			show_status = 'Confirmed'
		elsif i<5
			show_status = 'Pending'
		else 
			show_status = 'Cancelled'
		end

		sch = Schedule.create(
			tour_id:t.id,
			venue_id:v.id, 
			day_id:day.id,
			show_status: show_status,
			sound_check_time: Time.parse(day_num.to_s + " 09:00:00 +0100").strftime('%l %M %p'),
    		doors_time: Time.parse(day_num.to_s + " 10:00:00 +0100").strftime('%l %M %p '),
    		set_time: Time.parse(day_num.to_s + " 11:30:00 +0100").strftime('%l %M %p '),
    		show_schedule: "Weezer 6pm\n SNST 7:15\n Foo Fighters 8:30\n",
    		guest_list: "John's mom\n Sarah Stapp\n The guys from Atlantic\n" )

		inc = Income.create(tour_id: t.id, guarantee: 300, schedule_id: sch.id)

	end
end