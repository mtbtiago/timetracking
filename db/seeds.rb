# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
url_shortener = Project.create name: "Url shortener", description: "the ugly"
url_shortener.entries.create(hours: 1, minutes: 59, comments: "almost two hours")
url_shortener.entries.create(hours: 0, minutes: 30)
Project.create name: "My eBay", description: "the good"
Project.create name: "My amazon", description: "the bad"

manolo = Person.create(name: "Manolo")
pepe = Person.create(name: "Pepe")
url_shortener.people << manolo
url_shortener.people << pepe

# (33..127).each do |n|
# 	Project.create(name: "Project #{n}", description: "Description #{n.chr}")
# end

