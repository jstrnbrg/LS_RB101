# RB100-109: Assignment preparation

## Keep in mind
- Read task properly
- Answer with precision, use correct terminology
- Use line references
- Highlight specific syntactical conventions or technical observations where relevant
- Identify the key fundamental concept or concepts being demonstrated in the question.

## Key concepts to revise
1. Variable scope (local, in methods, in blocks)
1.1. Variable shadowing
2. Method definition and invocation
3. Mutation (i.e. when does passing object to method mutate it)
4. Working with collections (each, map, select, reduce)
5. Variable as pointers
6. puts vs return
7. Truthiness
8. Implicit returns of methods and blocks


## 1. Variable scope
- Constants are available anywhere in the programme and should be **constant**
- A local variable’s scope is determined by where it is initialized.
- Local variables initialized in an outer scope can be accessed in an inner scope, but not vice versa.
- You can mutate outside local variables from within inner scope and have that change affect the outer scope.
- Local variable scope is defined by a block.
- A block is a piece of code **following a method invocation**, usually delimited by either curly braces `{}` or `do/end`.
- Attention: `{…}` following a for loop is **not** a new block as that isn’t a method invocation, whereas `{…}` following `.times` is a new block.
- A method definition `def ...` has no notion of “outer” or “inner” scope – you **must explicitly pass in any parameters to a method definition.**

## 1.1. Variable shadowing
- Variable shadowing happens when a block parameter has the same name as the name of the local variable which was initialized outside of the block.
- The consequence of the variable shadowing is that it prevents access to variables of the same name initialized outside of the block.

## 2. Method definition and invocation
- Methods are defined with parameters, but they are invoked with arguments.
- A method only has access to the variables passed in as arguments
- Method definition is when, within our code, we define a Ruby method using the `def` keyword.
- Method invocation is when we call a method.
- Method invocation followed by `{..}` or `do..end` defines a block; the block is part of the method invocation.
- Essentially the block acts as an argument to the method. When a method is called with a block it acts as an argument to that method.

## 3. Mutation
- Most, but not all mutating methods have `!` in their name
- A variable is merely a name for some object.
- Multiple variables can reference the same object, so modifying an object using a given variable name will be reflected in every other variable that is bound to that object.
- Objects can be either mutable or immutable. Mutable objects can be changed; immutable objects cannot be changed.
- In Ruby, numbers and boolean values are immutable.
- Normal assignment and re-assigment (`+=` and alike) are not mutating
- Indexed assignment is mutating (whereas normal assignment isn’t) e.g. arr[2] = “hi”
- Concatenation using << is mutating

## 4. Working with collections
### each method
- `[1, 2, 3, 4].each { |num| puts num }`
- Iterates through the array object & passes each element of the array to the block
- Executes the block with the current argument
- When finished with all iterations it returns the original array.
- `.each` ignores the return value of the block at each iteration

### map method
- `[1, 2, 3, 4].map { |num| num * 2 }`
- Iterates through the array object & passes each element of the array to the block
- Executes the block with the current argument
- Takes the return value of the block and moves it into a new array
- When finished with all iterations it returns that new array containing the return values of all block iterations.

### select method
- `[1, 2, 3, 4].select { |num| puts num }`
- Iterates through the array object & passes each element of the array to the block
- Executes the block with the current argument.
- If the block evaluates to `true` the current argument is added to a new array.
- If the block evaluates to `false` the next iteration beginns.
- Remember: Everything in Ruby evaluates to boolean true except `false` and `nil`

### reduce method
- `[1, 2, 3, 4].reduce { |sum, num| sum += num }`
- Applies operation to each element in array and returns result `sum`
- Iterates through the array object & passes each element of the array to the block
- Executes the block with the current argument.

## 5. Variables as pointers
-  Ruby exhibits a combination of behaviors from both “pass by reference” as well as “pass by value”. Some people call this pass by reference of the value or call by sharing.
- When an operation within the method mutates the caller, it will affect the original object. (i.e. pass by reference )

## 6. puts vs return
- `puts` prints the argument to the console and returns `nil`
- `return` returns object to the calling level (one level up)

## 7. Truthiness
- In Ruby, every value apart from false and nil, evaluates to true in a boolean context.
- We can therefore say that in Ruby, every value apart from false and nil is truthy.
- We can also say that false and nil are falsey.
- This is not the same as saying every value apart from false and nil is true, or is equal to true.

## 8. Implicit returns of methods and blocks
- Methods and blocks return the last line that is evaluated unless there is an explcit `return` before.


## Useful phrases
### Assignment and re-assignment
```
a = 'hello'
b = a
a = 'goodbye'
```
- On line 1 we initialise the local variable `a` and create a new string object with the value `hello` whose reference is assigned to `a`.
- On line 2 we initialise the local variable `b` and assign it the string object that the local variable `a` references. Both variables now reference to the same object.
- On line 3 we re-assign the local variable `a` to a new string object with the value `goodbye` whose reference is now stored by `a`. `b` still holds the reference to the string object with the value `hello`

```
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```
- On line 1-8 we define a method called `example` that takes one parameter.
- On line 2 we initialise the local variable `i` and assign to it the integer object with the value `3`.
- On line 3 we are calling the `loop` kernel method and pass in the `do end` block as the argument.
- On line 4 we are calling the `puts` method and pass in the local `str` variable as the argument. This will print the value of `str` when the method is executed.
- On line 5 we are re-assigning the local variable `i` to the result of `i -1`. `i -= 1` is synthetical sugar for that. Speaking of synthetical sugar (ss), `-` is also ss for the `Integer#-` method, so we could rewrite that line as `i = i.-(1)`. So on that line we are re-assigning i to the return value of the method call `Integer#` with `1` passed in as the argument.
- On line 6 we `break` out of the loop if the value of the object that `i` references is equal to `0`.
- On line 10 we invoke the method `example` and pass a string object with the value `hello` as the argument.
- The code will print `hello` to the console three times and return `nil` as loops without with a standard `break` expression return nil and a method returns the return value of the last line executed.
