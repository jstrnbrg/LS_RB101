# Array exercises

# Exercise 1
arr = [1, 3, 5, 7, 9, 11]
number = 3
puts arr.include?(number)


# Exercise 2
arr = ["b", "a"]
arr = arr.product(Array(1..3)) # [["b", 1], ["a", 1], ["b", 2], ["b", 2], ["b", 3], ["a", 3]]
arr.first.delete(arr.first.last) # [["b"], ["a", 1], ["b", 2], ["b", 2], ["b", 3], ["a", 3]]

arr = ["b", "a"]
arr = arr.product([Array(1..3)])
arr.first.delete(arr.first.last)

## TODO: watch video for exercise 2

# Exercise 3
arr = [["test", "hello", "world"],["example", "mem"]]
example = arr[1][0]
puts example

# Exercise 4
arr = [15, 7, 18, 5, 12, 8, 5, 1]
puts arr.index(5) #3 => find index of value 5 which is 3
#arr.index[5] #error
puts arr[5] #8 get value of item at index 5 which is 8

# Exercise 5
string = "Welcome to America!"
a = string[6] #e
puts a
b = string[11] #A
puts b
c = string[19] #nil
puts c

# Exercie 6
names = ['bob', 'joe', 'susan', 'margaret']
names[names.find_index('margaret')] = 'jody'
puts names

# Exercise 7

array = ["Hello", "this", "is", "an", "array"]
array.each_with_index { |v,i| puts "Index #{i} has value #{v}"}

# Exercise 8
original = [1,2,3,4,5]
new = original.map {|x| x+2 }
p original
p new
