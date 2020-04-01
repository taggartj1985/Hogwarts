require('pry')
require_relative('./model/student.rb')
require_relative('./model/house.rb')


Student.delete_all
House.delete_all

house1 = House.new({
  'name' => "Gryffindor",
  'logo' => "https://vignette.wikia.nocookie.net/harrypotter/images/3/3c/Download-1.jpg/revision/latest/top-crop/width/360/height/450?cb=20170414162625&path-prefix=it"
  })
house2 = House.new({
    'name' => "Ravenclaw",
    'logo' => "https://www.theshopthatmustnotbenamed.co.uk/img/product/harry-potter-coaster-ravenclaw-crest-blue-5047-600.jpg"
  })
house3 = House.new({
    'name' => "Hufflepuff",
    'logo' => "https://vignette.wikia.nocookie.net/harrypotter/images/0/06/Hufflepuff_ClearBG.png/revision/latest?cb=20161020182518"
    })
house4 = House.new({
    'name' => "Slytherin",
    'logo' => "https://cdn.shopify.com/s/files/1/1943/7257/products/BannerFlag-Slytherin-HarryPotter-Product-_3-4895205600157_grande.jpg?v=1520334092"
      })
house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  'first_name' => 'Harry',
  'second_name' => 'Potter',
  'age' => 14,
  'house_id' => house1.id
  })

student2 = Student.new({
  'first_name' => 'Andrew',
  'second_name' => 'Woodbridge',
  'age' => 18,
  'house_id' => house2.id
  })
student3 = Student.new({
  'first_name' => 'John',
  'second_name' => 'Taggart',
  'age' => 25,
  'house_id' => house3.id
  })
student4 = Student.new({
  'first_name' => 'Antonio',
  'second_name' => 'Lorusso',
  'age' => 32,
  'house_id' => house4.id
  })
student1.save()
student2.save()
student3.save()
student4.save()

binding.pry
nil
