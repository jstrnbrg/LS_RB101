# def print_me()
#   puts "I'm printing within the method!"
# end
#
# print_me


# def print_me2()
#   "I'm printing within the method!"
# end
#
# puts print_me2


# def hello()
#   "Hello"
# end
#
# def world()
#   "world"
# end
#
# def greet()
#   hello + " " + world
# end
#
# puts greet


# def car(x, y)
#   puts "#{x} #{y}"
# end
#
# car('Toyota', 'Corolla')



# daylight = [true, false].sample
#
# def time_of_day(bool)
#   puts bool ? "It's daytime!" : "It's nighttime!"
# end
#
# time_of_day(daylight)



# def dog(name)
#   return name
# end
#
# def cat(name)
#   return name
# end
#
# puts "The dog's name is #{dog('Spot')}."
# puts "The cat's name is #{cat('Ginger')}."



# def assign_name(name="Bob")
#   return name
# end
#
# puts assign_name('Kevin') == 'Kevin'
# puts assign_name == 'Bob'




# def add(x,y)
#   return x+y
# end
#
# def multiply(x,y)
#   return x*y
# end
#
# puts add(2, 2) == 4
# puts add(5, 4) == 9
# puts multiply(add(2, 2), add(5, 4)) == 36



def name(arr)
  return arr.sample
end

def activity(arr)
  return arr.sample
end

def sentence(name, activity)
  return "#{name} did #{activity}"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
