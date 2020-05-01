---
layout: post
title: "RB101: Scope & Mutability"
description: "Notes from the first module of the Launch School core curriculum"
date: 2020-02-14
feature_image:
tags: [learning, launch-school]
---


## Truthiness
- In Ruby, every value apart from false and nil, evaluates to true in a boolean context.
- We can therefore say that in Ruby, every value apart from false and nil is truthy.
- We can also say that false and nil are falsey.
- This is not the same as saying every value apart from false and nil is true, or is equal to true.

## Imperative vs declarative
- Imperative: concerned with "HOW" you’re going to do something. Lists the raw steps.
- Declarative: concerned with the higher level "WHAT" you're trying to do. Abstraction.

<!--more-->


## Debugging
1. Reproduce the Error: You need a deterministic way to consistently reproduce the problem, and only then can you start to isolate the root cause.
2. Determine the Boundaries of the Error: Try to modify the data or code to get an idea of the scope of the error and determine the boundaries of the problem. Most problems can be solved in many ways, and the deeper you understand the problem, the more holistic solution you can come up with.
3. Find the origin of the problem
4. Understand the reason of the problem
5. Implement a fix
6. Text the fix

## Coding tips
- Use descriptive variable names
- In Ruby, make sure to use snake_case when naming everything, except classes which are CamelCase or constants, which are all UPPERCASE.
- Don't mutate CONSTANTS.
- A method should either return something or mutate the caller, not both.
- Your goal should be to build small methods that are like LEGO blocks: they should be stand-alone pieces of functionality that you can use to piece together larger structures. You don't want these methods to be mentally taxing to use.
- Methods that mutate the caller should be named with a "update_" prefix.
- Methods that print something should be named with a "print_" prefix.
- Watch your indentation. 2 spaces, not tabs.
- In Ruby, everything is truthy except nil and false.
- Don't mutate the caller during iteration, e.g. don't do:
```
numbers = [1,2,3,4]
numbers.each {|x| numbers.delete(x)}
#You would expect numbers to be empty but actually it still contains [2,4] ???
```
- Prevent variable shadowing: Variable shadowing occurs when you choose a local variable in an inner scope that shares the same name as an outer scope. It prevents you from accessing the outer scope variable from an inner scope.
- Don't use assignment in a conditional i.e. don't do `if name = "Ben"`
- Use underscore for unused parameters

## Scope
### Local variable scope
- A local variable's scope is determined by where it is initialized.
- Local variables initialized in an outer scope can be accessed in an inner scope, but not vice versa.
- You can mutate outside local variables from within inner scope and have that change affect the outer scope.
- Local variable scope is defined by a block.
- A block is a piece of code following a *method invocation*, usually delimited by either curly braces {} or do/end. e.g. {...} following a `for` loop is not a new block as that isn't a method invocation, whereas {...} following `.times` is a new block.
-  A method definition `def ...` has no notion of "outer" or "inner" scope -- you must explicitly pass in any parameters to a method definition.


### Method definition & invocation
- Method definition is when, within our code, we define a Ruby method using the `def` keyword.
- Method invocation is when we call a method.
- Method invocation followed by ``{..}`` or `do..end` defines a block; the block is part of the method invocation.
- Essentially the block acts as an argument to the method. In the same way that a local variable can be passed as an argument to a method at invocation, when a method is called with a block it acts as an argument to that method.

### Passing arguments to a method: Can be ignored or used

```
def greetings(str)
  puts "Goodbye"
end

def greetings2(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
# Outputs 'Goodbye'

greetings2(word)

# Outputs 'Hello'
# Outputs 'Goodbye'
```

### Passing a block to a method: Can be ignored or used

```
def greetings
  puts "Goodbye"
end

def greetings2
  yield
  puts "Goodbye"
end

word = "Hello"

greetings do
  puts word
end

# Outputs 'Goodbye'

greetings do
  puts word
end

# Outputs 'Hello'
# Outputs 'Goodbye'
```

### Pass by Reference vs Pass by Value
-  In most programming languages, there are two ways of dealing with objects passed into methods. You can either treat these arguments as "references" to the original object or as "values", which are copies of the original.
- In C, when you "pass by value", the method only has a copy of the original object. Operations performed on the object within the method have no effect on the original object outside of the method.
- As you can see from the previous examples, Ruby exhibits a combination of behaviors from both "pass by reference" as well as "pass by value". Some people call this pass by reference of the value or call by sharing.
- When an operation within the method mutates the caller, it will affect the original object.
- Example: When we use + to concatenate two arrays together, it is returning a new array and not mutating the original. However, when we use << to append a new value into an array, it is mutating the original array and not returning a new array.
- Reassignment to a variable doesn’t change the old object referenced by that variable; instead, the variable is bound to a completely new object — made to reference a new object.


There are  three answers to the question of what object passing strategy ruby uses:

- *Pass by reference value* is probably the most accurate answer, but it’s a hard answer to swallow when learning ruby, and isn’t particularly helpful when trying to decide what will happen if a method modifies an argument – at least not until you fully understand it.
- *Pass by reference* is accurate so long as you account for assignment and immutability.
- Ruby acts like *pass by value* for immutable objects, *pass by reference* for mutable objects is a reasonable answer when learning about ruby, so long as you keep in mind that ruby only appears to act like this.

### Example
```
# Creates a string object with the value 'Bob', stores a reference/pointer to this object in the variable name.
name = 'Bob'

# Assign to save_name the reference that name holds; now save_name holds a reference to the same object.
save_name = name

# Create a new string object with the value 'Alice', store a reference to this object in the name variable. (re-assigned)
name = 'Alice'


puts name, save_name
# Alice
# Bob

# Creates a string object with the value 'Bob', stores a reference to this object in the variable name.
name = 'Bob'

# Assign to save_name the reference that name holds; now save_name holds a reference to the same object.
save_name = name

# Invoke the mutating version of upcase on the object referenced by name.
# As a result the string (referenced by both name and by save_name) has a value of 'BOB'.
name.upcase!


puts name, save_name
# BOB
# BOB
```

### Example
```
# The following code:
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# will output:

Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

# The key to understanding this output is the line:

array1.each { |value| array2 << value }

# During the iteration over array1, value is being pushed to array2. Value is, in fact, just a reference that points to a string in memory. So, at the end of the iteration, array2 holds a collection of references pointing to the same strings as the references in array1.

# If you were to look at the object_id's of each array, you would see they are identical.

#So when the program iterates the second time:

array1.each { |value| value.upcase! if value.start_with?('C', 'S') }

# upcase! is mutating the string in memory that the references in array1 point to. Since the references in array2 also point to the exact same strings, the changes made when iterating through array1 appear when printing the values in array2
```

### Mutability
- A variable is merely a name for some object.
- Multiple variables can reference the same object, so modifying an object using a given variable name will be reflected in every other variable that is bound to that object.
- Objects can be either mutable or immutable. Mutable objects can be changed; immutable objects cannot be changed.
- In Ruby, numbers and boolean values are immutable.

```
number = 3
puts number #3

number = number * 2
puts number #6
```

- This did not mutate the original number object. Instead number was re-assigned to a new integer object with the value of 6. This disconnected the original object from the variable, which makes it available for garbage collection unless another reference to the object exists elsewhere.

### Mutating methods
- Most mutating methods have a `!` at the end if their name, not all though.
- Indexed assignment is mutating (whereas normal assignment isn't) e.g. arr[2] = "hi"
- Concatenation using `<<` is mutating
- Setter methods are mutating

## Links
- https://launchschool.com/blog/references-and-mutability-in-ruby
- https://launchschool.com/blog/mutating-and-non-mutating-methods
- https://launchschool.com/blog/object-passing-in-ruby
