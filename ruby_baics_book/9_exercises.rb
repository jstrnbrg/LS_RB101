# Exercises

# £xercise 1
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
numbers.each {|x| puts x}

# Exercise 2
numbers.each {|x|
  if x > 5
    puts x
  end
}

# Exercise 3
odd_numbers = numbers.select {|x| x % 2 != 0 }
p odd_numbers

# Exercise 4
numbers.push(11) #append to end
numbers.unshift(0) #append to front
p numbers


# Exercise 5
numbers.pop()
numbers.push(3)
p numbers

# Exercise 6
numbers.uniq!
p numbers

# Exercise 7
# Arrays persist order and don't have keys.

# Exercise 8
hash_1 = {
  item: "This is an item" # new syntax
}

hash_2 = {
  :item => "This is an item" # old syntax
}

p hash_1
p hash_2

# Exercise 9
h = {a:1, b:2, c:3, d:4}
b = h[:b]
h[:e] = 5
h = h.select {|k,v| v > 3.5 }
p h

# Exercise 10
hash = {names: ['bob', 'joe', 'susan']} # hash values as arrays
arr = [{name: 'bob'}, {name: 'joe'}, {name: 'susan'}] # array of hashes

# Exercise 12
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_data.each_with_index {|person, index|
  name = contacts.keys[index]
  contacts[name] = {email: person[0], address: person[1], phone: person[2]}
}
p contacts


# Exercise 13
joe_email = contacts["Joe Smith"][:email]
p joe_email
sally_phone = contacts["Sally Johnson"][:phone]
p sally_phone

# Exercise 14, see 12

# Exercise 15
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if {|word| word.start_with?("s")}
arr.delete_if { |word| word.start_with?("s", "w") }
p arr

# Exercise 16
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
a = a.map {|item| item.split(" ")}.flatten
p a

# Exercise 17
# Hashes are equal if key/value pairs are equal. Order and syntax don't matter
