require 'spec_helper'

describe Patient do
  it 'initializes as an instance of patient' do
    test_patient = Patient.new({"name" => "Billy Joel", "birthday" => '1965-09-25', "doc_id" => "2"})
    test_patient.should be_an_instance_of Patient
  end
  it 'is initialized with a name' do
    test_patient = Patient.new({"name" => "Billy Joel", "birthday" => '1965-09-25', "doc_id" => "2"})
    test_patient.name.should eq 'Billy Joel'
  end
  it 'is initialize with a birthday' do
    test_patient = Patient.new({"name" => "Billy Joel", "birthday" => '1965-09-25', "doc_id" => "2"})
    test_patient.birthday.should eq '1965-09-25'
  end
  it 'should save the patient' do
    test_patient = Patient.new({"name" => "Billy Joel", "birthday" => '1965-09-25', "doc_id" => "2"})
    test_patient.save
    Patient.all.should eq [test_patient]
  end
end
