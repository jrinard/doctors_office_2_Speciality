require('sinatra')
require('sinatra/reloader')
require('./lib/patient')
require('./lib/doctor')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "doctors_office"})

get("/") do
  erb(:index)
end

get("/doctors/new") do
  erb(:doctor_form)
end

post("/doctors") do
  name = params.fetch("name")
  doctor = Doctor.new({:id => nil, :name => name})
  doctor.save()
  erb(:success)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

get("/doctors/:id") do
  @doctor = Doctor.find(params.fetch("id").to_i())
  erb(:doctor)
end

post("/patients") do
  name = params.fetch("name")
  birthdate = params.fetch("birthdate")
  doctor_id = params.fetch("doctor_id").to_i()
  @doctor = Doctor.find(doctor_id)
  @patient = Patient.new({:id => nil, :name => name, :birthdate => birthdate, :doctor_id => doctor_id})
  @patient.save()
  erb(:success2)
end
