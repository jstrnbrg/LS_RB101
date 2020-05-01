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

# p books.sort {|a,b|
#   a[:published].to_i <=>  b[:published].to_i
# }

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
res = munsters.each_with_object([]) do |person, result|
  age =  person[1]["gender"] == "male" ? person[1]["age"] : 0
  result << age
end
#p res.sum

# Given this previously seen family hash, print out the name, age and gender of each family member:
# munsters.each do |name, values|
#   puts "#{name} is a #{values["age"]} year old #{values["gender"]}."
# end

# Using the each method, write some code to output all of the vowels
# from the strings.
# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
# hsh.each_pair do |key, val|
#   val.each {|item|
#     p item.gsub(/[^aeiuo]/, "")
#   }
# end

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.
# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
# result = arr.map do |item|
#   item.sort do |a,b|
#     b <=> a
#   end
# end
# p result


#Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.
# result = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
#   hash.map do |k,v|
#     {k => v+1}
#   end
# end
# p result

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in structure
# to the original but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
result = arr.map do |item|
  item.select {|v| v % 3 ==0}
end
#p result

# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
result = arr.each_with_object({}) do |item, hash|
  hash[item[0]] = item[1]
end
#p result

# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into
# consideration the odd numbers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
result = arr.sort do |a,b|
  a_odd = a.select {|v| v.odd?}
  b_odd = b.select {|v| v.odd?}
  a_odd <=> b_odd
end

result = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
# p result

# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = hsh.each_with_object([]) do |fruit, array|
  array << fruit[1][:colors].map {|i| i.capitalize }
  array << fruit[1][:size].upcase
end
#p result

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
result = arr.select do |hash|
  hash.values.flatten.all? {|i| i.even? }
end
#p result

# Write a method that returns one UUID when called with no parameters.
# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end
  uuid
end
