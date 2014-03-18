class Patient
  attr_reader :name, :birthday, :doc_id
  def initialize(input_hash)
    @name = input_hash["name"]
    @birthday = input_hash["birthday"]
    @doc_id = input_hash["doc_id"]
  end

  def self.all
    results = DB.exec("SELECT * FROM patients")
    patients = []
    results.each do |result|
      patients << Patient.new(result)
    end
    patients
  end

  def save
    DB.exec("INSERT INTO patients (name, birthday, doc_id) VALUES ('#{@name}', '#{@birthday}', '#{@doc_id}');")
  end

  def ==(another_patient)
    self.name == another_patient.name && self.birthday == another_patient.birthday
  end

  def self.find_patients(doc_id)
    results = DB.exec("SELECT * FROM patients WHERE doc_id = '#{doc_id}';")
    found_patients = []
    results.each do |result|
      found_patients << result['name']
    end
    found_patients
  end
end
