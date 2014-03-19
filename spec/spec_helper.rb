require 'rspec'
require 'pg'
require 'doctor'
require 'patient'
require 'speciality'
require 'insurance'
DB = PG.connect({dbname: 'doctor_office_test'})


RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM speciality *;")
    DB.exec("DELETE FROM insurance *;")
  end
end
