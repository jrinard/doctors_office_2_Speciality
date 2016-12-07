require('spec_helper')

describe(Specialty) do
  describe('.all') do
    it('starts off with no specialties') do
      expect(Specialty.all()).to(eq([]))
    end
  end
end

describe("#==") do
  it("is the same specialty if it has the same name") do
    specialty1 = Specialty.new({:id => nil, :specialty => "pediatrician"})
    specialty2 = Specialty.new({:id => nil, :specialty => "pediatrician"})
    expect(specialty1).to(eq(specialty2))
  end
end

describe("#save") do
  it("lets you save specialty to the database") do
    specialty = Specialty.new({:id => nil, :specialty => "pediatrician"})
    specialty.save()
    expect(Specialty.all()).to(eq([specialty]))
  end
end

describe("#id") do
  it("tells you specialty ID") do
    specialty = Specialty.new({:id => nil, :specialty => "pediatrician"})
    specialty.save()
    expect(specialty.id()).to(be_an_instance_of(Fixnum))
  end
end

describe("#specialty") do
  it("tells you specialty") do
    specialty = Specialty.new({:id => nil, :specialty => "pediatrician"})
    expect(specialty.specialty()).to(eq("pediatrician"))
  end
end

describe(".find") do
 it("returns a specialty by its ID") do
   specialty1 = Specialty.new({:id => nil, :specialty => "pediatrician"})
   specialty1.save()
   specialty2 = Specialty.new({:id => nil, :specialty => "xray"})
   specialty2.save()
   expect(Specialty.find(specialty2.id())).to(eq(specialty2))
 end
end

describe('#doctors') do
  it('returns an array of doctors for that specialty') do
    specialty = Specialty.new({:id => nil, :specialty => "pediatrician"})
    specialty.save()
    expect(specialty.id).not_to be nil
    test_doctor1 = Doctor.new({:id => nil, :name => "Thor", :specialty_id => specialty.id()})
    test_doctor1.save()
    test_doctor2 = Doctor.new({:id => nil, :name => "Thor", :specialty_id => specialty.id()})
    test_doctor2.save()
    expect(test_doctor2.specialty_id).not_to be nil
    expect(specialty.doctors()).to(eq([test_doctor1, test_doctor2]))
  end
end
