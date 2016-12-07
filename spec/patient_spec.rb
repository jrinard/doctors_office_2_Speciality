require("spec_helper")

describe(Patient) do
  describe(".all") do
    it("is empty at first") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same Patient if it has the same name") do
      patient1 = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      patient2 = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      expect(patient1).to(eq(patient2))
    end
  end

  describe("#save") do
    it("adds a patient to the array of saved patients") do
      test_patient = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      test_patient.save()
      expect(Patient.all()).to(eq([test_patient]))
    end
  end

  describe('#id') do
    it('lets you read the ID out') do
      test_patient = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      test_patient.save()
      expect(test_patient.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#name") do
    it("tells you doctors name") do
      test_patient = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      expect(test_patient.name()).to(eq("Cody"))
    end
  end

  describe("#birthdate") do
    it("tells you patients birthdate") do
      test_patient = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      expect(test_patient.birthdate()).to(eq("1991-06-11"))
    end
  end

#is this needed?
  describe("#doctor_id") do
    it("tells you doctors id for a specfic patient") do
      test_patient = Patient.new({:id => nil, :name => "Cody", :birthdate => '1991-06-11', :doctor_id => 1})
      expect(test_patient.doctor_id()).to(eq(1))
    end
  end

end
