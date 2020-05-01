puts "Your first name pls: "
name = gets.chomp
puts "Your last name pls: "
name += " " + gets.chomp
puts "Hello #{name}"

10.times {
  puts name
}
