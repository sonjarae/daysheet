module ApplicationHelper

	def venue(id)
		Venue.find(id)
	end

	def tour (id) 
		Tour.find (id)
	end

	def schedules (day_id) 
		Schedule.where ( 'schedules.day_id = ' + day_id.to_s)
	end

	/# 
	def income (schedule_id)
		Schedule.where ( 'incomes.schedule_id = ' + schedule_id.to_s)
	end
	.#/


	def income (id)
		p "id = " + id
		Income.find (id)
	end

	/#
	turn into joins
	def day_of_tour (this_date, start_date)
	  	Day.where( 'days.date BETWEEN ? AND ?', this_date , start_date ).count
	end

	def incomes_for_schedule (sch_id)
		Income.where ( 'incomes.schedule_id = ' + sch_id.to_s)
	end
	#/

	def get_metrics
		id = Tour.where("Active != TRUE").first.id
		@days_this_tour = Day.where("tour_id = id").count
		@schedules = Schedule.where("tour_id = id")
		@schedule_num = schedules.count
		for s in schedules 
			if show_status == 'Played'
				@shows_played_this_tour = s.count
			else 
				@shows_left_this_tour = s.count
			end
		end
	end


#<h3>Shows this tour:</h3>
#<h3>Avg Attendance:</h3>
#<h3>High Attendance:</h3>
#<h3>Low Attendance:</h3>
 
end
