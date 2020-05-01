# car = {
#   type: "sedan",
#   color: "blue",
#   milage: 80000,
# }
#
# car[:year] = 2003
#
# car.delete(:milage)
#
# p car
#
# p car[:color]
#
#

#
# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
#
# numbers.each {|k,v| puts "A #{k} number is #{v}"}



# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
# half_numbers = numbers.map {|k, v| v/2 }
# puts half_numbers



# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
#
# #p low_numbers = numbers.select {|k,v| v < 25}
#
# p low_numbers = numbers.select! {|k,v| v < 25}
# p numbers


# cars = {
#   car: {
#     type: "sedan",
#     color: "blue",
#     year: 2003,
#   },
#   truck: {
#     type: "pickup",
#     color: "red",
#     year: 1998,
#   },
# }
#
# puts cars


car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}
