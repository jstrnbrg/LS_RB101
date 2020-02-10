#Q1
if false
  greeting = “hello world”
end

greeting
# Assumption: undefined method or local variable error
# Solution: a variable initialised insided an if block will be nil if not executed

#Q2
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
# Assumption: last line prints {:a=>"hi"}
# Solution: the last line prints {:a=>"hi there"} as informal_greeting is a
# reference to the original greetings[:a] and then mutated that on the next line.

#Q3
# A)
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #"one"
puts "two is: #{two}" #"two"
puts "three is: #{three}" #"three"

# B)
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #"one"
puts "two is: #{two}" #"two"
puts "three is: #{three}" #"three"

# C)
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #"two"
puts "two is: #{two}" #"three"
puts "three is: #{three}" #"one"


# Q4

def is_an_ip_number?(word)
  return word.to_i >= 0 && word.to_i <= 255 && word == word.to_i.to_s
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end

puts dot_separated_ip_address?("10.a.2.6")
