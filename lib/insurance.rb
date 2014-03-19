class Insurance
  attr_reader :name, :id
  def initialize(attributes)
    @name = attributes["name"]
    @id = attributes["id"]
  end

  def self.all
    results = DB.exec("SELECT * FROM insurance")
    insur_companies = []
    results.each do |result|
      insur_companies << Insurance.new(result)
    end
    insur_companies
  end

  def save
    DB.exec("INSERT INTO insurance(name) VALUES ('#{@name}');")
  end

  def ==(another_insurance_comp)
  self.name == another_insurance_comp.name

  end
end
