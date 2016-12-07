require 'pry'

class Specialty

  attr_reader(:id, :specialty)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
  end

  define_singleton_method(:all) do
    returned_specialties = DB.exec("SELECT * FROM specialties;")
    specialties = []
    returned_specialties.each() do |specialty|
      id = specialty.fetch('id').to_i()
      specialty = specialty.fetch('specialty')
      specialties.push(Specialty.new({:id => id, :specialty => specialty}))
    end
    specialties
  end


define_method(:==) do |another_specialty|
  self.specialty().==(another_specialty.specialty()).&(self.id().==(another_specialty.id()))
end

define_method(:save) do
  result = DB.exec("INSERT INTO specialties (specialty) VALUES ('#{@specialty}') RETURNING id")
  @id = result.first().fetch("id").to_i()
end

define_singleton_method(:find) do |id|
  found_specialty = nil
  Specialty.all().each() do |special|
    if special.id().==(id)
      found_specialty = special
    end
  end
  found_specialty
end

define_method(:doctors) do
  list_doctors = []
  doctors = DB.exec("SELECT * FROM doctors WHERE specialty_id = #{self.id()};")
  doctors.each() do |doctor|
    id = doctor.fetch('id').to_i()
    name = doctor.fetch('name')
    specialty_id = doctor.fetch('specialty_id').to_i()
    list_doctors.push(Doctor.new({:id => id, :name => name, :specialty_id => specialty_id}))
  end
  list_doctors
end



end
