require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('./model/student.rb')
require_relative('./model/house.rb')
also_reload('./models/*')

  get '/students' do
    @students = Student.all()
  erb(:index)
  end

  get '/students/new'do
  @houses = House.all()
  erb(:new)
  end

  post '/students' do
    new_student = Student.new(params)
    new_student.save
    erb(:create)
  end
