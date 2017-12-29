module ApplicationHelper

	def venue(id)
		Venue.find (id)
	end

	def tour (id)
		Tour.find(id)
	end

	def day (id) 
		Day.find(id)
	end

	def schedule (id) 
		Schedule.find(id)
	end

	def income (schedule_id)
		Income.where ( 'incomes.schedule_id = ' + schedule_id.to_s)
	end

	def schedules_for_day (day_id) 
		Schedule.where ( 'schedules.show_status = \'Confirmed\' AND schedules.day_id = ' + day_id.to_s)
	end 

	def day_for_schedule_id (schedule_id) 
		day = Day.select('date').joins("INNER JOIN schedules ON schedules.day_id = days.id and schedules.id = schedule_id")
	end 
	
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
