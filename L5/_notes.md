# Sorting
## The <=> Method
- Any object in a collection that we want to sort must implement a <=> method.
- This method performs comparison between two objects of the same type and returns a -1, 0, or 1, depending on whether the first object is less than, equal to, or greater than the second object.
- If the two objects cannot be compared then nil is returned
- The return value of the ``<=>`` method is used by sort to determine the order in which to place the items.


## ASCII
- use `.ord` to get characters ASCII number
- Digits and (most) punctuation come before letters
- Uppercase letters come before lowercase letters
- There is an extended ASCII table containing accented and other characters - this comes after the main ASCII table.


## Sort method
- calling `.sort` with a block gives us more control over how the collection is sorted.
```
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]
```


# Nested data structures
- `arr = [[1, 3], [2]]` array contains 2 nested arrays
- `arr[0] # => [1,3]`
- `arr[0][1] # => 3`


## Updating collection elements
- updating an element in a collection mutates the caller / destructive
```
arr = [[1, 3], [2]]
arr[1] = "hi there"
arr  # => [[1, 3], "hi there"]
```

## Appending to an inner array
- `arr[0] << 3` is element reference (`arr[0]` which returns `[1]`) and `<< 3` appends 3
```
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```

## Examples
```
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]              # => ["a", ["b"]]
arr[0][1][0]        # => "b"
arr[1]              # => { :b => "bear", :c => "cat" }
arr[1][:b]          # => "bear"
arr[1][:b][0]       # => "b"
arr[2][2]           # => "b"
```

## Shallow Copy
- when we want to save the original collection before performing some major modifications
- Both `.dup` and `.clone` create a shallow copy of an object.
- "Shallow" means that only the object that the method is called on is copied, but not nested objects inside, *nested objects will be shared.*
```
# Example 1
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]


# Example 2
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
```
- In example 1, only arr 2 is modified since the destructive method `.map!` is called on the copied object itself, i.e. the array and not on the individual elements.
- In example 2, both arrays are modified as the destructive method `.upcase!` is called on the individual elements which are shared between the two copies.


## Freezing objects
- Objects can be frozen in order to prevent them from being modified using `.freeze`
- Only mutable objects can be frozen because immutable objects, like integers, are already frozen.
- We can check if an object is frozen with the `frozen?` method.
- `freeze` only freezes the object it's called on. If the object it's called on contains other objects, those objects won't be frozen. For example, if we have a nested array the nested objects can still be modified after calling freeze.
- The difference between `.dup` and `.clone` is that clone preserves the frozen state of an object.


# Remember:
- Do not mutate the collection that you're iterating through, make a copy, iterate through copy and mutate original.
- When analysing code, go line by line and pay attention to the:
   - *action*
   - the *object* the action is taken on
   - *side effects* (e.g. output, mutation)
   - the actions *return value*
   - what *happens to the return value* (is it used? )
