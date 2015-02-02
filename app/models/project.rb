class Project < ActiveRecord::Base
	# for change table name (optional)
	# set table_name = "projects"
	def self.iron_find(n)
		where("name = ?",n).first
	end

	def self.clean_old
		where("created_at < ?",7.day.ago).destroy_all
	end
end
