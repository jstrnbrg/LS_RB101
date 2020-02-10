
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}


# not using for..in loop
def select_fruit(hash)
  results = {}
  counter = 0
  keys = hash.keys
  loop do
    break if counter == hash.size
    key = keys[counter]
    value = hash[key]
    if value == "Fruit"
      results[key] = value
    end
    counter += 1
  end
  results
end

#puts select_fruit(produce)



def double_numbers_non_mutating(numbers)
  doubled_numbers = []
  counter = 0
  loop do
    break if counter == numbers.size
    current_number = numbers[counter]
    doubled_numbers << current_number * 2
    counter += 1
  end
  doubled_numbers
end


def double_numbers_mutating!(numbers)
  counter = 0
  loop do
    break if counter == numbers.size
    current_number = numbers[counter]
    numbers[counter] = current_number * 2
    counter += 1
  end
  #return numbers #don't return and mutate in the same method, this returns a reference to (mutated) original array
end


numbers = [1,2,3,4,5,6]
#puts numbers.object_id
# puts double_numbers_non_mutating(numbers)
#puts double_numbers_mutating!(numbers)
# p numbers




my_numbers = [1, 4, 3, 7, 2, 6]


def multiply(arr, num)
  result = []
  counter = 0
  loop do
    break if arr.size == counter
    result << arr[counter] * num
    counter +=1
  end
  result
end

puts multiply(my_numbers, 4)
