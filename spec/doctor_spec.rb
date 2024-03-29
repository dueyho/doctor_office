require 'spec_helper'

describe Doctor do
  it 'initializes an instance of doctor' do
    test_doctor = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor.should be_an_instance_of Doctor
  end
  it 'initializes with a name' do
    test_doctor = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor.name.should eq "Bob Vance"
  end
  it 'initializes with a spec_id' do
    test_doctor = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor.spec_id.should eq "1"
  end
  it 'initializes with a insur_id' do
    test_doctor = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor.insur_id.should eq "2"
  end
  it 'saves doctors to the database' do
    test_doctor = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor.save
    Doctor.all.should eq [test_doctor]
  end
  it 'is the same doctor if it has the same name and spec_id' do
    test_doctor1 = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor2 = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor1.should eq test_doctor2
  end

  it 'should return all the patients that are seeing that doctor' do
    test_doctor = Doctor.new({"name" => "Bob Vance", "spec_id" => "1", "insur_id" => "2"})
    test_doctor.save
    test_patient1 = Patient.new({"name" => "Billy Joel", "birthday" => '1965-09-25', "doc_id" => test_doctor.id})
    test_patient2 = Patient.new({"name" => "Smithy Joel", "birthday" => '1965-09-25', "doc_id" => test_doctor.id})
    test_patient1.save
    test_patient2.save
    Patient.find_patients(test_doctor.id).should eq ['Billy Joel', 'Smithy Joel']
  end
end
