# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
phone = 9765432112

99.times do |n|
	name = "vishnu-#{n + 1}"
	email = "vishnu-#{n + 1}@gmail.com"
	phone = phone + n + 1
	User.create!(
		name: name,
		email: email,
		phone: phone,
		birth: Date.today - 1000,
		password: "123456",
		gender: "Male",
		current_sign_in_at: Date.today - 1,
		last_sign_in_at: Date.today
	)
end