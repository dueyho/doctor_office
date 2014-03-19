require 'spec_helper'

describe Insurance do
  it "initializes as an instance of insurance" do
    test_insurance = Insurance.new({"name" => "Blue Cross"})
    test_insurance.should be_an_instance_of Insurance
  end
  it "has is initialized with a name" do
    test_insurance = Insurance.new({"name" => "Blue Cross"})
    test_insurance.name.should eq "Blue Cross"
  end
  it "saves the insurance company" do
    test_insurance = Insurance.new({"name" => "Blue Cross"})
    test_insurance.save
    Insurance.all.should eq [test_insurance]
  end
  it 'makes two insurance objects with the same name equal' do
    test_insurance1 = Insurance.new({'name' => "Blue Cross"})
    test_insurance2 = Insurance.new({'name' => "Blue Cross"})
    test_insurance1.should eq test_insurance2
  end
end
