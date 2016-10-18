# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  { name: 'USD', value: '30.78' },
  { name: 'USD', value: '32.26', forced_till: Time.now + 1.day },
  { name: 'USD', value: '35.21' },
  { name: 'USD', value: '40.5' },
].each do |currency|
  Currency.find_or_create_by(currency)
end