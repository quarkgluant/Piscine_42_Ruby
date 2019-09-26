# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: 'Pat', email: 'pat@localhost', password: '12345678', password_confirmation: '12345678')
User.create(name: 'Toto', email: 'toto@localhost', password: '12345678', password_confirmation: '12345678')
