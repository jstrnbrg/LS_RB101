sun = ['visible', 'hidden'].sample

# unless sun == 'visible'
#   puts "The clouds are blocking the sun!"
# end

# puts "The sun is so bright!" if sun == "visible"
# puts "The clouds are blocking the sun!" unless sun == "visible"

# boolean = [true, false].sample
# puts boolean ? "I'm true!" : "I'm false!"


# stoplight = ['green', 'yellow', 'red'].sample

# case stoplight
#   when "green"
#     puts "Go"
#   when "yellow"
#     puts "Slow down"
#   when "red"
#     puts "Stop!"
# end

# if stoplight == "green"
#   puts "Go"
# elsif stoplight == "yellow"
#   puts "Slow down"
# elsif stoplight == "red"
#   puts "Stop!"
# end


# status = ['awake', 'tired'].sample
# def statusF(status)
#   if status == "awake"
#     return "Be productive"
#   else
#     return "Go to sleep!"
#   end
# end
#
# result = statusF(status)
# puts result


# number = rand(10)
#
# if number == 5
#   puts '5 is a cool number!'
# else
#   puts 'Other numbers are cool too!'
# end


stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'; puts 'Go!'
when 'yellow'; puts 'Slow down!'
else; puts 'Stop!'
end
