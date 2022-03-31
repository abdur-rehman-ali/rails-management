# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(name:'ali1 joiya',age:20,email:'alijoyia911@gmail.com')

20.times do |i| 
    Student.create(
        name:"student #{i+1}",
        age:"20",
        email:"email#{i+1}@gmail.com"
    )
end