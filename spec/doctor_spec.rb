require('spec_helper')

describe(Doctor) do
  describe('.all') do
    it('starts off with no doctors') do
      expect(Doctor.all()).to(eq([]))
    end
  end

describe("#==") do
  it("is the same doctor if it has the same name") do
    doctor1 = Doctor.new({:id => nil, :name => "Thor", :specialty_id => nil})
    doctor2 = Doctor.new({:id => nil, :name => "Thor", :specialty_id => nil})
    expect(doctor1).to(eq(doctor2))
  end
end

describe("#save") do
  it("lets you save Doctors to the database") do
    doctor = Doctor.new({:id => nil, :name => "Thor", :specialty_id => nil})
    doctor.save()
    expect(Doctor.all()).to(eq([doctor]))
  end
end

  describe("#id") do
    it("tells you doctors ID") do
      doctor = Doctor.new({:id => nil, :name => "Thor", :specialty_id => nil})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#name") do
    it("tells you doctors name") do
      doctor = Doctor.new({:id => nil, :name => "Thor", :specialty_id => nil})
      expect(doctor.name()).to(eq("Thor"))
    end
  end

  describe(".find") do
   it("returns a Dcotor by its ID") do
     test_doctor = Doctor.new({:id => nil, :name => "Thor", :specialty_id => nil})
     test_doctor.save()
     test_doctor2 = Doctor.new({:id => nil, :name => "Strange", :specialty_id => nil})
     test_doctor2.save()
     expect(Doctor.find(test_doctor2.id())).to(eq(test_doctor2))
   end
 end

 describe('#patients') do
   it('returns an array of patients for that doctor') do
     test_doctor = Doctor.new({:id => nil, :name => "Thor", :specialty_id => nil})
     test_doctor.save()
     test_patient1 = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => test_doctor.id()})
     test_patient1.save()
     test_patient2 = Patient.new({:id => nil, :name => "Josh", :birthdate => '1985-06-11', :doctor_id => test_doctor.id()})
     test_patient2.save()
     expect(test_doctor.patients()).to(eq([test_patient1, test_patient2]))
   end
 end




end
