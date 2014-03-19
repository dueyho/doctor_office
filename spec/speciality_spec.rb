require 'spec_helper'

describe Speciality do
  it 'initializes an instance of Speciality' do
    test_speciality = Speciality.new({'type' => "orthopedic surgeon"})
    test_speciality.should be_an_instance_of Speciality
  end
  it 'initializes with a type' do
    test_speciality = Speciality.new({'type' => "orthopedic surgeon"})
    test_speciality.type.should eq "orthopedic surgeon"
  end
  it 'saves the speciality' do
    test_speciality = Speciality.new({'type' => "orthopedic surgeon"})
    test_speciality.save
    Speciality.all.should eq [test_speciality]
  end
  it 'makes two speciality objects with the same type equal' do
    test_speciality1 = Speciality.new({'type' => "orthopedic surgeon"})
    test_speciality2 = Speciality.new({'type' => "orthopedic surgeon"})
    test_speciality1.should eq test_speciality2
  end
  it 'finds the speciality when given the id' do
    test_speciality = Speciality.new({'type' => "orthopedic surgeon"})
    test_speciality.save
    Speciality.find(test_speciality.id).should eq "orthopedic surgeon"
  end
end
