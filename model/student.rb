require_relative('../db/sql_runner.rb')
require_relative('./house.rb')

class Student

  attr_accessor :first_name, :second_name, :age, :house_id
  attr_reader :id

  def initialize(student)
    @id = student['id'].to_i if student['id']
    @first_name = student['first_name']
    @second_name = student['second_name']
    @age = student['age'].to_i
    @house_id = student['house_id'].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, second_name, age, house_id)
          VALUES ($1, $2, $3, $4 ) RETURNING id;"
    values = [@first_name, @second_name, @age, @house_id]
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM students"
    all = SqlRunner.run(sql)
    return all.map{|student| Student.new(student)}
  end

 def house()
   sql = "SELECT * from houses WHERE id = $1"
   values = [@house_id]
   all_house =  SqlRunner.run(sql,values).first()
   return House.new(all_house)
 end

 def self.find_student_by_id(id)
   sql = "SELECT * FROM students WHERE id = $1"
   values = [id]
   student = SqlRunner.run(sql,values).first
   return nil if student == nil
   return Student.new(student)
 end

 def self.delete_all()
   sql = "DELETE FROM students"
   SqlRunner.run(sql)
 end

 def full_name()
   return "#{@first_name} #{@second_name}"
 end

end
