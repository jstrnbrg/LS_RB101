## Arrays

array = [1, 'Bob', 4.33, 'another string']

# Access first and last item
first = array.first
last = array.last

# Access any item based on index
forth = array[3]

# Remove and return last item
last_pop = array.pop #permanently remove the last element, returns last element

# Append item to array
array.push("new last element") #append new item to end of array
array << "last last element" #append new item to end of array with shovel <<

# Append item to front of array
array.unshift(2)

# map/collect method (do something with every item in array) do not mutate
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
modified_array = numbers.map {|item| item**2 } #does not mutate array, returns modified array

# delete_at(): mutates the caller
array.delete_at(2) # remove item at index 2, mutates the caller and returns removed item

# delete() items based on value, not index: mutates the caller
array.delete('Bob') # removes all instances of 'Bob' and returns 'Bob'

# uniq() removes all duplicats from array: does NOT mutate the caller
array.uniq() # reomoves all duplicate values and returns new array

# select iterates through array and returns new array containing all items that evaluate the condition based to select(condition) as true
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new = numbers.select {|item| item > 5} #does not mutate the caller
puts new

# include? to check if item is in array
puts numbers.include?(3)

# flatten to turn multi-dimensional array into single-dimenstion
two_d_array = [1,2,3,[4,5],6,[7,[8,9]]]
p two_d_array.flatten

# each_with_index to iterate array with index and value variable
a = [1, 2, 3, 4, 5]
a.each_with_index { |val, idx| puts "The value at index #{idx+1}. is #{val}" }

# sort : not destructive
a = [5, 3, 8, 2, 4, 1]
sorted = a.sort
p sorted


# Mutating vs not-mutating the caller
def mutate(arr)
  arr.pop
end

def not_mutate(arr)
  arr.select { |i| i > 3 }
end

a = [1, 2, 3, 4, 5, 6]
mutate(a)
not_mutate(a)

#puts a # [1, 2, 3, 4, 5]

# each
a = [1, 2, 3]
a.each { |e| puts e + 2 } # returns original caller [1,2,3]

# map
a = [1, 2, 3]
a.map { |x| x**2 }
=> [1, 4, 9] # returns new array containing the values returned by the block

# use each for iteration and map for transformation.
