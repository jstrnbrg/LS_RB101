# Practice Problems: Additional Practice

#Given the array below
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#Turn this array into a hash where the names are the keys and the values are the positions in the array.

hash = flintstones.each_with_index.each_with_object({}) {|(v, i), hash|
  hash[v] = i
}
p hash




#Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = ages.values.sum
puts sum



#In the age hash remove people with age 100 and greater.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.keep_if {|key, val|
  val < 100
}
p ages



#Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.min




#In the array find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
index = flintstones.index {|val| val.start_with?("Be")}
p index



# Amend this array so that the names are all shortened to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! {|val|
  val[0...3]
}
p flintstones


#Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"
unique_chars = statement.downcase.split("").uniq
restult = unique_chars.each_with_object({}) {|item, hash|
  hash[item] = statement.downcase.count(item)
}
p restult


#As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:
sentence = "the flintstones rock"
words = sentence.split
sentence = words.map {|item|
  item.capitalize
}.join(" ")
p sentence





#Given the munsters hash below modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior).

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

#Your solution should produce the hash below
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
}

munsters.map {|key, val|
  case val["age"]
  when 0...17
    val["age_group"] = "kid"
  when 18...64
    val["age_group"] = "adult"
  else
    val["age_group"] = "senior"
  end
}
p munsters
