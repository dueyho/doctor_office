class Doctor

  attr_reader :name, :spec_id, :insur_id, :id

  def initialize(input_hash)
    @name = input_hash["name"]
    @spec_id = input_hash["spec_id"]
    @id = input_hash["id"]
    @insur_id = input_hash["insur_id"]
  end

  def self.all
    results = DB.exec("SELECT * FROM doctors")
    doctors = []
    results.each do |result|
      name = result['name']
      doctors << Doctor.new(result)
    end
    doctors
  end

  def save
    results = DB.exec("INSERT INTO doctors(name, spec_id) VALUES ('#{@name}', '#{@spec_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_doctor)
    self.name == another_doctor.name && self.spec_id == another_doctor.spec_id
  end
end
