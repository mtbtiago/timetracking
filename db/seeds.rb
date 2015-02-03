# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create name: "Url shortener", description: "the ugly"
Project.create name: "My eBay", description: "the good"
Project.create name: "My amazon", description: "the bad"

(33..127).each do |n|
	Project.create(name: "Project #{n}", description: "Description #{n.chr}")
end