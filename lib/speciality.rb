class Speciality
  attr_reader :type, :id
  def initialize(input)
    @type = input['type']
    @id = input['id']
  end

  def save
    results = DB.exec("INSERT INTO speciality(type) VALUES ('#{type}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    results = DB.exec("SELECT * FROM speciality")
    specialities = []
    results.each do |result|
      specialities << Speciality.new(result)
    end
    specialities
  end



  def self.find(input_id)
    results = DB.exec("SELECT * FROM speciality WHERE id = '#{input_id}';")
    found_speciality = ''
    results.each do |result|
      found_speciality << result['type']
    end
    found_speciality
  end

  def ==(another_speciality)
    self.type == another_speciality.type
  end
end
