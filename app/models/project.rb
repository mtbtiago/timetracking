class Project < ActiveRecord::Base
	has_many :entries
	# for change table name (optional)
	# set table_name = "projects"
	def self.iron_find(n)
		where("name = ?",n).first
	end

	def self.clean_old
		where("created_at < ?",7.day.ago).destroy_all
	end

	def self.last_created_projects(q)
		order(created_at: :desc).limit(q)
		# is the same than ...
		# limit(q).order(created_at: :desc)
	end

  def calc_total_hours(year, month)
  	first_day = Date.new(year,month,1)
  	last_day = Date.new(year,month,-1)
  	entries_where = entries.where(date: first_day..last_day)
  	minutes = entries_where.reduce(0) {|result,e|
  		result += (e.hours * 60) + e.minutes
  	}
  	hours = minutes / 60
  	mins = minutes % 60
  	"#{hours} hours and #{mins} minutes"
  end

end
