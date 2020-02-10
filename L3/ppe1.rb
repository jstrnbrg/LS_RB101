# Q1
numbers = [1, 2, 2, 3]
numbers.uniq

#puts numbers
# expected: 1,2,2,3 (each on a single line) as numbers is not mutated or re-assigned to the newly returned array


# Q2
# 1. what is != and where should you use it? #means not equal
# 2. put ! before something, like !user_name #used to turn any object into the opposite of their boolean equivalent
# 3. put ! after something, like words.uniq! #indication that the method mutates the caller (it's part of the method name, not ruby syntax)
# 4. put ? before something #ternary operator for if...else
# 5. put ? after something #indication that method returns boolean
# 6. put !! before something, like !!user_name  #used to turn any object into their boolean equivalent

#Q3
# advice = "Few things in life are as important as house training your pet dinosaur."
# advice.gsub!('important', 'urgent')

# Q4
# numbers = [1, 2, 3, 4, 5, 1, 1]
# numbers.delete_at(1) #deletes value at index 1
# numbers.delete(1) #deletes value 1 where ever it is in the array (multiple times)
# puts numbers

#Q5
# puts (10..100).include?(42)
# puts (10..100).cover?(42)


#Q6
# famous_words = "seven years ago..."
# prepend = "Four score and "
# way_1 = prepend + famous_words
# puts way_1
# way_2 = "#{prepend}#{famous_words}"
# puts way_2
# way_3 = famous_words.prepend(prepend)
# puts way_3

#Q7
# flintstones = ["Fred", "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
# flintstones.flatten!
# p flintstones


#Q8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")
