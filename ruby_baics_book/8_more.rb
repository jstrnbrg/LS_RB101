# Regex

# Syntax 1 using =~
puts "House" =~ /s/ #returns index where match starts #3

# Syntax 2 using .matche
puts /s/.match("House") #returns match or nil



# Variables as pointers
# Remember some operations will mutate the actual address space in memory,
# thereby affecting all variables that point to that address space.
# Some operations will not mutate the address space in memory, and instead will
# re-point the variable to a new address space in memory.

# If you call a method that mutates the caller, it will change the value in that
# address space, and any variables also pointing there will be affected.
# Therefore, always pay attention whether your variables are pointing to the
# same object (space in memory) or if they are dealing with copies that occupy
# different address space in memory.

a = "hi there"
b = a # both a and b point to same address in memory
a = "not here" # a is reassigned, new address in memory
# => a = "not here", b = "hi there"


a = "hi there"
b = a  # both a and b point to same address in memory
a << ", Bob" # the original value in memory is changed, both a and b still reference the same memory address
# => a = "hi there", b = "hi there"


# Blocks
def take_block(&block) #. The ampersand (&) in the method definition tells us that the argument is a block
  block.call
end

take_block {
  puts "Block being called in the method!"
}


def take_block(number, &block)
  block.call(number)
end

number = 42
take_block(number) { |num|
  puts "Block being called in the method! #{num}"
}

# Procs
def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)


# Begin / rescue
def divide(number, divisor)
  begin
    answer = number / divisor
  rescue ZeroDivisionError => e
    puts e.message
  end
end

puts divide(16, 4)
puts divide(4, 0)
