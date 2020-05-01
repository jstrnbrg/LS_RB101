# Write a method that displays an 8-pointed star in an nxn grid, where n is an
# odd integer that is supplied as an argument to the method.
# The smallest such star you need to handle is a 7x7 grid.
def print_stars(stars, spaces, width)
  pattern = "*" + " " * spaces
  puts ("#{" " * spaces}#{pattern * stars}").center(width)
end

def star(n)
  num_other_half_lines = (n - 1) / 2
  width = 2*n
  spaces = (n / 2) - 1
  num_other_half_lines.times do
    print_stars(3, spaces, width)
    spaces -= 1
  end
  print_stars(n, 0, width)
  spaces = 0
  num_other_half_lines.times do
    print_stars(3, spaces, width)
    spaces += 1
  end
end

#star(7)


# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
# the transpose of the original matrix. Note that there is a Array#transpose
# method that does this -- you may not use it for this exercise. You also are
# not allowed to use the Matrix class from the standard library. Your task is
# to do this yourself.
# Take care not to modify the original matrix: you must produce a new matrix and
# leave the original matrix unchanged.

# First try
def transpose1 (matrix)
  matrix_size = matrix[0].size
  new_matrix = Array.new(matrix_size) {Array.new(matrix_size, 0)}
  row = 0
  until row == matrix_size do
    column = 0
    until column == matrix_size do
      new_matrix[column][row] = matrix[row][column]
      column += 1
    end
    row +=1
  end
  new_matrix
end

# Second try
def transpose2(matrix)
  matrix_size = matrix[0].size
  new_matrix = Array.new(matrix_size) {Array.new(matrix_size, 0)}
  matrix_size.times {|row| matrix_size.times {|col| new_matrix[col][row] = matrix[row][col]}}
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = transpose2(matrix)
#
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


# Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.
def transpose_any_size1(matrix)
  matrix_width = matrix[0].size
  matrix_height = matrix.count
  new_matrix = Array.new(matrix_width) {Array.new(matrix_height, 0)}
  row = 0
  until row == matrix_height do
    column = 0
    until column == matrix_width do
      new_matrix[column][row] = matrix[row][column]
      column += 1
    end
    row +=1
  end
  new_matrix
end

def transpose_any_size2(matrix)
  matrix_width = matrix[0].size
  matrix_height = matrix.count
  new_matrix = Array.new(matrix_width) {Array.new(matrix_height, 0)}
  matrix_height.times {|row| matrix_width.times {|col| new_matrix[col][row] = matrix[row][col]}}
  new_matrix
end

# p transpose_any_size1([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# p transpose_any_size1([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# p transpose_any_size1([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# p transpose_any_size1([[1]]) == [[1]]


# Write a method that takes an arbitrary matrix and rotates it 90 degrees
# clockwise as shown above.
def rotate90(matrix)
  matrix_width = matrix[0].size
  matrix_height = matrix.count
  new_matrix = Array.new(matrix_width) {Array.new(matrix_height, 0)}

end

matrix1 = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
#new_matrix2 = rotate90(matrix2)
#new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

#p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
#p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
#p new_matrix3 == matrix2

# Fix the bug:
def my_method(array)
  if array.empty?
    []
  elsif #array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

#p my_method([]) == []
# p my_method([3]) #== [21]
# p my_method([3, 4]) == [9, 16]
# p my_method([5, 6, 7]) == [25, 36, 49]


# Write a method that takes two sorted Arrays as arguments, and returns a new
# Array that contains all elements from both arguments in sorted order.
# You may not provide any solution that requires you to sort the result array.
# You must build the result array one element at a time in the proper order.
# Your solution should not mutate the input arrays.
def merge(arr1, arr2)
  result = []
  arr1_ind = 0
  arr2_ind = 0
  loop do
    if arr1_ind == arr1.size
      return result.concat(arr2[arr2_ind..-1])
    elsif arr2_ind == arr2.size
      return result.concat(arr1[arr1_ind..-1])
    end

    if arr1[arr1_ind] <= arr2[arr2_ind]
      result << arr1[arr1_ind]
      arr1_ind += 1
    else
      result << arr2[arr2_ind]
      arr2_ind += 1
    end
  end
end



# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]

# Sort an array of passed in values using merge sort.
# You can assume that this array may contain only one type of data.
# And that data may be either all numbers or all strings.
# Solution:
def merge_sort(array)
  return array if array.size == 1
  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
