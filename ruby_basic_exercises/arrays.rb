# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pet = pets[2]
# puts my_pet



# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = pets[2], pets[3] # or pets[2..3]
# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"



# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = pets[2..3]
# my_pets.pop()
# puts my_pets


# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = pets[2..3]
# my_pets.pop
# my_pets.push(pets[1])
# puts my_pets


# colors = ['red', 'yellow', 'purple', 'green']
# colors.each {|c| puts "I'm the color #{c}!"}



# numbers = [1, 2, 3, 4, 5]
# p doubled_numbers = numbers.map{|x| x*2 }


# numbers = [5, 9, 21, 26, 39]
# p divisible_by_three = numbers.select{|x| x % 3 == 0}


# ['Dave', 7, 'Miranda', 3, 'Jason', 11]
# [['Dave', 7], ['Miranda', 3], ['Jason', 11]]


# favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
# p flat_favorites = favorites.flatten


array1 = [1, 5, 9]
array2 = [1, 9, 5]
p array1 == array2
