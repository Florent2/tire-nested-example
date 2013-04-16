# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


3.times { |i| User.create! name: "user#{i}"}
3.times { |i| Topic.create! name: "topic#{i}"}
Follow.create! user: User.first, topic: Topic.first
