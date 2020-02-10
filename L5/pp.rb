# Practice Problems

#How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']
arr.sort {|a, b|
  b.to_i <=> a.to_i
}


#How would you order this array of hashes based on the year of publication of
#each book, from the earliest to the latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

p books.sort {|a,b|
  a[:published].to_i <=>  b[:published].to_i
}

#For each of these collection objects demonstrate how you would reference the letter 'g'.
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
# arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
#hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
#hsh2[:third].key(0)


# Given this nested Hash figure out the total age of just the male members of the family.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# My attempt using the new methods (such as select, map, inject)
males = munsters.select {|k,v|
    v["gender"] == "male"
}
p males_1 = males.map {|k,v|
  v["age"]
}

p males_1.inject {|sum, item|
  sum + item
}

# Solution 
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end

total_male_age # => 444
