class Doctor

  attr_reader :name, :speciality, :id

  def initialize(input_hash)
    @name = input_hash["name"]
    @speciality = input_hash["speciality"]
    @id = input_hash["id"]
  end

  def self.all
    results = DB.exec("SELECT * FROM doctors")
    doctors = []
    results.each do |result|
      name = result['name']
      # speciality = result ['speciality']
      doctors << Doctor.new(result)
    end
    doctors
  end

  def save
    results = DB.exec("INSERT INTO doctors(name, speciality) VALUES ('#{@name}', '#{@speciality}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  # def self.find(user_input)
  #   results = DB.exec("SELECT * FROM doctors WHERE name = '#{user_input}';")
  #   found_results = []
  #   results.each do |result|
  #     found_results << result
  #   end
  #   found_results
  # end

  def ==(another_doctor)
    self.name == another_doctor.name && self.speciality == another_doctor.speciality
  end
end
