# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: "Jack", password: "cheddar")
User.create!(username: "Jill", password: "cheddar")

Goal.create!(title: "Study French", is_private: true, user_id: 1)
Goal.create!(title: "Learn yoga", is_private: false, user_id: 1)
Goal.create!(title: "Run a marathon", is_private: false, user_id: 2)
Goal.create!(title: "Learn to program", is_private: true, user_id: 2)
