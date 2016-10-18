# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  { name: 'USD', code: 'usd', value: '30.78' },
  { name: 'USD', code: 'usd', value: '32.26', forced_till: Time.now + 1.day },
  { name: 'USD', code: 'usd', value: '35.21' },
  { name: 'USD', code: 'usd', value: '40.5' },
]