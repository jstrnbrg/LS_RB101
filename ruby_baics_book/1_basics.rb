puts "Max" + " " + "Kaiser"

x = 1234
puts x/1000
puts x/100%10
puts x/10%10
puts x%10

movies = {
  "1999" => "Movie 1",
  "2000" => "Movie 2",
  "2001" => "Movie 3"
}

movies.each {|x,y|
  puts x
}

movie_array = ["1999", "2000", "2001"]

movie_array.each {|x| puts x}

for x in 5..8 do
  num = 1
  until x == 0 do
    num *= x
    x -= 1
  end
  puts num
end

array = [2.3, 5.6, 790.1]

array.each {|x| puts x**2}
