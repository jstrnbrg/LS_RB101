# # Exercise 1
# family = {  uncles: ["bob", "joe", "steve"],
#             sisters: ["jane", "jill", "beth"],
#             brothers: ["frank","rob","david"],
#             aunts: ["mary","sally","susan"]
#           }
#
# brothers_and_sisters = family.select { |k,v| (k == :brothers) || (k == :sisters)}.values.flatten
# p brothers_and_sisters
#
# # Exercise 2
# hash_1 = {
#   one: "one",
#   two: "two",
#   three: "three"
# }
#
# hash_2 = {
#   four: "four",
#   five: "five",
#   six: "six"
# }

# new = hash_1.merge(hash_2)
# puts new
# puts hash_1
# puts hash_2
#
# new2 = hash_1.merge!(hash_2) # transforms hash_1
# puts new2
# puts hash_1
# puts hash_2

#
# # Exercise 3
# # Print all keys
# family.each {|k,v|
#   puts k
# }
#
# family.each {|k,v|
#   puts v
# }
#
# family.each {|k,v|
#   puts "The key is #{k} the value is #{v}"
# }

# Exercie 4
# person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
# puts person[:name]

# # Exercise 5
# puts person.has_key?("address")

# Exercise 6
# x = "hi there"
# my_hash = {x: "some value"} # x symbol as key
# my_hash2 = {x => "some value"} # x variable as key
# p my_hash
# p my_hash2

# Exercise 7
# B

# Exercise 8
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# My first try
words_sorted = words.map {|word| word.chars.sort.join }

words_sorted_hash = {}
words.each {|word|
  words_sorted_hash[word] = word.chars.sort.join
}

anagram_list = []
words_sorted_hash.each {|item|
  search_term = item.last
  anagrams = []
  words_sorted_hash.each {|item|
    if item.last == search_term
      anagrams.push(item.first)
    end
  }
  anagram_list.push(anagrams.sort)
}

anagram_list_unique = anagram_list.uniq()
anagram_list_unique.each {|x|
  p x
}

# Launch School solution
# result = {}
#
# words.each do |word|
#   key = word.split('').sort.join
#   if result.has_key?(key)
#     result[key].push(word)
#   else
#     result[key] = [word]
#   end
# end
#
# result.each_value {|v|
#   p v
# }
