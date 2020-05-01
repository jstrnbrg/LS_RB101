# Hashes

# Old notation
ld_syntax_hash = {:name => 'bob'}

# New notation
person = { height: '6 ft', weight: '160 lbs' }

# Add to existing hash
person[:hair] = 'brown'

# Remove from existing hash
person.delete(:age)

# Access value at specific key
value = person[:weight]

# Merge two hashes
person.merge!(ld_syntax_hash) # ! (bang) changes the caller (person)

# Iterate over hash
person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

person.each do |key, value|
  puts "Bob's #{key} is #{value}"
end

# Common hash methods
name_and_age = { "Bob" => 42, "Steve" => 31, "Joe" => 19}
boolean = name_and_age.has_key?("Steve") #returns true or false
matching_pairs = name_and_age.select { |k,v| (k == "Bob") || (v == 19) } #returns all pairs that match criteria
value = name_and_age.fetch("Steve") # returns value associated with key
array = name_and_age.to_a # returns array representation of hash e.g. [["Bob", 42], ["Steve", 31], ["Joe", 19]]
keys = name_and_age.keys # returns array of all keys
values = name_and_age.keys # returns array of all values
 
