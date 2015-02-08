class List
  attr_reader :id
  attr_accessor :name

  def initialize(attrs)
    @name = attrs['name']
    @id = attrs['id']
  end

  def name
    @name
  end

  def id
    @id
  end

  def to_s
    "#{@id} #{@name}"
  end

  def to_fancy_s
    "I am a list with id #{@id} and name #{name}"
  end

  def ==(another_list)
    self.name == another_list.name
  end

  def self.all
    results = DB.exec("SELECT * FROM lists;")
    lists = []
    results.each do |result|
      lists << List.new(result)
    end
    lists
  end

  def save
    results = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end
end
