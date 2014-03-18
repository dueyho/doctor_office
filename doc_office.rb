require './lib/doctor'
require './lib/patient'
require 'pg'

DB = PG.connect({dbname: 'doctor_office'})
def main_menu
  puts "Welcome to the hospital"
  puts "For doctor menu, press 'D'"
  puts "For patient menu, press 'P'"
  puts "To exit the hospital press 'X'"
  input = gets.chomp.upcase
  case input
  when "D" then main_menu_doctor
  when "P" then main_menu_patient
  when "X" then puts "Goodbye"
  else
    puts "Not a valid option"
    main_menu
  end
end

def main_menu_doctor
  puts "To add doctor, press 'D'"
  puts "To list doctors, press 'L'"
  puts "To list patients by doctor press 'PD'"
  puts "To go back to main menu press 'M'"
  input = gets.chomp.upcase
  case input
    when "D" then add_doctor
      main_menu_doctor
    when "L" then list_doctors
      main_menu_doctor
    when "M" then main_menu
    when "PD" then list_patients_by_doctor
    else
      puts "\nThat is not a valid option\n\n"
      main_menu_doctor
  end
  main_menu_doctor
end

def main_menu_patient
  puts "To add a patient, press 'P'"
  puts "To list patients, press 'L'"
  puts "To go back to main menu press 'M'"
  input = gets.chomp.upcase
  case input
    when "P" then add_patient
      main_menu_patient
    when "L" then list_patients
      main_menu_patient
    when "M" then main_menu
    else
     puts "\nThat is not a valid option\n\n"
      main_menu_patient
  end
  main_menu_patient
end

def add_doctor
  puts "Enter your doctor's name"
  doctor_name = gets.chomp
  puts "Enter your doctor's specialty"
  doctor_speciality = gets.chomp
  Doctor.new({"name" => doctor_name, "speciality" => doctor_speciality}).save
end

def add_patient
  puts "Enter the patient's name"
  patient_name = gets.chomp
  puts "Enter the patient's birthday(YYYY-MM-DD)"
  patient_bday = gets.chomp
  puts "choose the doctor your patient is seeing"
  list_doctors
  doc_id = gets.chomp.to_i
  Patient.new({"name" => patient_name, "birthday" => patient_bday, "doc_id" => doc_id}).save
end

def list_patients
  puts "\n"
  puts "List of all patients:"
  Patient.all.each_with_index do |patient, index|
    puts "#{index + 1}: #{patient.name} Birthday: #{patient.birthday}: doc_id: #{patient.doc_id}"
  end
end

def list_doctors
  puts "\n"
  puts "List of all doctors:"
  Doctor.all.each do |doctor|
    puts "#{doctor.id}: Dr. #{doctor.name} Speciality: #{doctor.speciality}"
  end
   puts "\n\n"
end

def list_patients_by_doctor
  puts "Type in doctor you would like to list the patients for"
  list_doctors
  input = gets.chomp
      Patient.find_patients(input).each_with_index do |patient, index|
        puts "#{index + 1}) #{patient}"
      end
end
main_menu

