# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
  city = City.create(name: Faker::GameOfThrones.city)
end

10.times do
  doctor = Doctor.create(first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        speciality: Faker::Job.title,
                        postal_code: Faker::Address.zip,
                        city_id: Faker::Number.between(1,5))
end

10.times do
  patient  = Patient.create(first_name: Faker::Name.first_name,
                            last_name: Faker::Name.last_name,
                            city_id: Faker::Number.between(1,5))
end

10.times do
  rdv = Appointment.create(doctor_id: Faker::Number.between(1,10),
                            patient_id: Faker::Number.between(1,10),
                            date: Faker::Time.forward(90, :day),
                            city_id: Faker::Number.between(1,5))
end

5.times do
  specialty = Specialty.create(name: Faker::Job.title)
end


10.times do
  joinDoctorSpecialty = JoinDoctorSpecialty.create(doctor_id: Faker::Number.between(1,10),
                                                  specialty_id: Faker::Number.between(1,5))
end
