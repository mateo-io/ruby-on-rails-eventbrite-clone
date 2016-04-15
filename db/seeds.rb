# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "Juan")
User.create(name: "Matt")
User.create(name: "Carl")

juan=User.find_by(id:1)
matt=User.find_by(id:2)
carl=User.find_by(id:3)

juan.events.create(description: "Lorem ipsum", date: Time.now+5.days)
juan.events.create(description: "Dubois", date: Time.now-1.year)
juan.events.create(description: "Tijuana", date: Time.now+3.months)
juan.events.create(description: "Lord Snow", date: Time.now+10.years)


matt.events.create(description: "Veni vidi vici", date: Time.now+3.week)
matt.events.create(description: "Carpe diem", date: Time.now+5.year)
matt.events.create(description: "Alma matter", date: Time.now+4.months)

carl.events.create(description: "Latin greet", date: Time.now+14.days)
carl.events.create(description: "Versehe nur bahnhoff", date: Time.now+9.days)
carl.events.create(description: "Auf widersehen", date: Time.now-420.hours)
carl.events.create(description: "Somewhere in the future", date: Time.now+420.hours)

User.all.map{|user| user.events.each{|event| user.attended_events<<event}}