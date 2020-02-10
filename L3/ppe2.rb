#Q1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
puts ages.keys.include?("Spot")
puts ages.key?("Spot")
puts ages.include?("Spot")

#Q2
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!

#Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages

#Q4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match?("Dino")

#Q5
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#Q6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones

#Q7
flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain
flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item

#Q8
advice = "Few things in life are as important as house training your pet dinosaur."
new = advice.slice!(0, advice.index('house')) #from index 0 to index of word house
#returns the match and
p new
p advice

#Q9
statement = "The Flintstones Rock!"
statement.count('t')
