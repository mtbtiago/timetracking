class Project < ActiveRecord::Base
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
end
