
# Exercise 1
words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

words.each {|word|
  puts /lab/.match?(word)
}

# Exercise 2
# def execute(&block)
#   block
# end
#
# execute { puts "Hello from inside the execute method!" }
# => nothing, the block is never .call ed

# Exercise 4
def execute(&block)
  block.call
end

execute { puts "Hello from inside the execute method!" }
