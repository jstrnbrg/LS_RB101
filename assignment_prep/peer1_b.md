
# Explain each element of this code, including what is the output, what is returned, and why.
​
5.times { |i| puts "Hello there, #{i}"}

First we create an integer object without assigning it to a variable and then call the `.times` method on it.
To `.times` we pass a block as the argument.
The block content is executed 5 times and each time the parameter `i` is reassigned to the `int -1`.
Therefore the output will be 5 lines of `Hello there, (num)` with num starting at 0, ending at (incl.) 4.
The method call will return the integer it has been called on, in this case `5` as calling `.times` with a block as an argument returns the object `.times` has been called on.
​
​
# What is the output of this code? What is returned? Why? What does this example demonstrate?
​
people = [["Ashley", "Ben"], ["Cassie", "David"], ["Erica", "Floyd"], ["Greta", "Harold"]]
​
def mystery(person)
  person[2][1] << "Jessica"
  person[2][1]
end
​
puts mystery(people)

The the `mystery` method will return `FloydJessica` which passed as an argument to `puts` and printed.
`puts` then returns nil.
This snippet demonstrates, that local variables declared outside a method which are passed into the method as an argument can be mutated within the method. The snippet also demonstrates how to access elements in a nested array.

​
​
#What is the output of lines 16 and 17? What do each return? What does this show about #delete and #delete_at?
​
numbers = [1,2,3,4,5]
p numbers.delete_at(1)
p numbers.delete(1)

Comment: I know you didn't ask for line by line explanation but I wanted to to practice ;)
On line 1 we initialise the local variable `numbers` and create a new array object which in turn references multiple integer objects with the values `1,2,3,4,5`. The reference of the array object is assigned to `numbers`.
On line 2 the `.delete_at` method is called on the numbers object with `1` passed in as an argument. That will delete (mutate) the value at the index position `1` which in this example is `2`. After that operation, the array is `[1,3,4,5]` which is returned and passed as the argument to the `p` method which then prints `[1,3,4,5]` to the console.
On line 3 `.delete` is called on numbers with an integer object with value `1` passed in as argument. That method will delete all objects that are equal to the argument's value (`1`) in the array and return the resulting array. In this case the method will return `[3,4,5]` which is then passed to `p` as an argument and `p` prints `[1,2,3]` to the console.
​
​
# What is the output of this code? What is returned? Why?
​
def pattern(n)
  (1..n).map{|x| x.to_s*x}.join("\n")
end
​
pattern(5)

Comment: I know you didn't ask for line by line explanation but I wanted to to practice ;)
On line 1-3 we define a method called `pattern` which takes one paramenter called `n`.
Within the method definition we first create an array from `1` to `n` (inclusive) on which the `.map` method is called. To the `.map` method we pass a block as an argument. The block is executed once for each item in the array and each time the parameter `x` is reassigned to the current value of the iteration. We then perform `x.to_s * x` for each iteration which is evaluated and is the return value of the block. So in the first iteration that `x` is `1`, that is transformed into a string object with the value `1` and then the `*` method is called on that string object which returns a new string object containing `x` copies of the the string object it was called on.
The `.map` method appends the return value of the block on each iteration to a new array. `.map` will return that array once all iterations are done.
When that is done `.join("\n")` will be called on the new array which joins all string objects in the array together using `\n` in-between, which will return one string object.
As that is also the last line within the method, that string object will be returned by the `pattern` method itself.
On line 5 we invoke the `pattern` method and pass in an integer object with the value `5` as an argument.
The return value will be `1\n22\n333\n4444\n55555` but nothing is outputted as neither `puts` nor `p` is called.
