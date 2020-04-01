require_relative('../db/sql_runner.rb')
require_relative('./student.rb')

class House

  attr_accessor :name, :logo
  attr_reader :id

  def initialize(house)
    @id = house['id'].to_i if house['id']
    @name = house['name']
    @logo = house['logo']
  end



def save()
  sql = "INSERT INTO houses (name,logo)
        VALUES ($1,$2) RETURNING id;"
  values = [@name, @logo]
  @id = SqlRunner.run(sql,values)[0]['id'].to_i
end

def self.all()
  sql = "SELECT * FROM houses"
  all = SqlRunner.run(sql)
  return all.map{|house| House.new(house)}
end

def student()
  sql = "SELECT * FROM students WHERE house_id = $1"
  values = [@id]
  all_student = SqlRunner.run(sql,values)
  return all_student.map{|student| Student.new(student)}
end

def self.find_house_by_id(id)
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  house = SqlRunner.run(sql,values)
  return nil if house == nil
  return House.new(house)
end

def self.delete_all()
  sql = "DELETE FROM houses"
  SqlRunner.run(sql)
end






end
