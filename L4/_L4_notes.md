---
layout: post
title: "RB101: Collections & Looping"
description: "Notes from the first module of the Launch School core curriculum"
date: 2020-02-14
feature_image:
tags: [learning, launch-school]
---

## Element reference
### String element reference
- integer-based index that represents each character in the string.
```
str = 'abcdefghi'
str[2] # => "c"
str[2, 3] # [starting index, number of chars] => "cde"
str[2, 3][0] # => chaining: str[2, 3] = > "cde", "cde"[0] => "c"
```
- using str[start_index, number of chars] is idential to str.slice(start_index, number of chars)

<!--more-->

### Array element reference  
- Arrays are lists of elements that are ordered by index, where each element can be any object.
- Arrays use an integer-based index to maintain the order of its elements.
- A specific element can be referenced using its index.
- Both hash keys and values can be any object in Ruby.
- But it is common practice to use symbols as the keys.
```
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2] # => "c"
arr[2, 3] #[start_index, number of elements] => ["c", "d", "e"]
```

### Hash Element Reference
- Hashes are another very common collection data structure that, instead of using an integer-based index, uses key-value pairs, where the key or the value can be any type of Ruby object.
- This allows for a more expansive and descriptive collection of elements.
- Keys in a hash must be unique, values can be duplicates.
- To get just the hash's keys use `.keys`, for the values use `.values`
```
hsh = { 'fruit' => 'apple', 'vegetable' => 'carrot' }
hsh['fruit']    # => "apple"
hsh['fruit'][0] # => "a"
```

### Out of Bounds Indices
- Referencing an out-of-bounds index returns nil.
- This is not necessarily a problem for a string, since we know that nil is an invalid return value; with an array, nil could be a valid return value since arrays can contain any other type of object, including nil. Therefore use: `arr.fetch(3) #returns IndexError if out of index`


### Negative Indices
- Elements in String and Array objects can be referenced using negative indices, starting from the last index in the collection -1 and working backwards.
- Negative indexes can also be out of bounds, they don't loop back over

### Invalid Hash Keys
- use `.fetch()` to check if key exists, throws `KeyError` if it doesn't.


### Conversion
- String#chars returns an array containing the individual chars.
- Array#join returns a string with the elements of the array joined together.
- Hash#to_a turns a hash into a nested array
- Array#to_h turns a nested array into a hash


## Element assignment
### String element assignment
```
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
```

### Array Element Assignment
```
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
```

### Hash Element Assignment
```
hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
hsh[:apple] = 'Fruit'
hsh # => { :apple => "Fruit", :carrot => "Produce", :pear => "Produce", :broccoli => "Produce" }
```

## Looping
- In Ruby, a simple loop is created by calling the Kernel#loop method and passing a block to it.
- `break` exits the loop
- When `next` is executed, it tells the loop to skip the rest of the current iteration and begin the next one
- When break is placed on the last line within the loop it mimics the behavior of a "do/while" loop. With a "do/while" loop, the code within the block is guaranteed to execute at least once.
- When break is placed on the first line within the loop it mimics the behavior of a "while" loop. With a "while" loop, the code below `break` may or may not execute at all, depending on the condition.
- Looping comprises four basic elements: a loop, a counter, a way to retrieve the current value, and a way to exit the loop.

## PEDAC
- P - [Understand the] Problem
- E - Examples / Test cases
- D - Data Structure
- A - Algorithm
- C - Code

### Understanding the Problem
1. Read the problem description.
2. Check the test cases, if any.
3. If any part of the problem is unclear, ask the interviewer or problem requester to clarify the matter.

### Data structures and Algorithm
4. Write down input, output, explicit and Implicit rules
5. Write pseudocode


## Selection and Transformation
- Selection is picking certain elements out of the collection depending on some criterion.
- Transformation, on the other hand, refers to manipulating every element in the collection.
- When performing transformation, it's always important to pay attention to whether the original collection was mutated or if a new collection was returned.

### Methods
- `.each` more elegant way to iterate over collection.
- `.each` over arrays need one parameter (value).
- `.each` over hashes need one parameter (key, value).
- `.each` always returns the original collection it was called on.
- `.select`returns a new collection containing all elements that fulfilled the criteria.
- `.select` uses the return of the block (i.e. the return value of the last expression in the block) to decide if the current element should be added to the returned collection or not. e.g. if the last expression in the block is `puts x` then no element will be added as `puts x` always returns `nil`
- `.map` places the return value of the block in the new collection that will be returned.
- `.any?` returns true if the block's return value in at least one iteration is truthy ( (like || statement )
- `.all?` returns true if the block's return value in every iteration is truthy ( (like && statement )
- Enumerable#first(num), num is optional, returns the first elements in the collection.
- Enumerable#each_with_index, on arrays the first argument is the current value and the second the index, on hashes the first argument represents the pair and the second the index
- Enumerable#include?(arg) returns true if arg is in enumerable, called on a hash, it checks if the key exists not if the value exists.
- Enumerable#partition ivides up elements in the current collection into two collections. The return value is a nested array, with the inner arrays separated based on the return value of the block.  

### The key things to think about are:
- What does each block iteration return?
- How does the method treat the block's return value?
- What is the return value of the whole method?
- Is the method destructive?
