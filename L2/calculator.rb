require 'yaml'
messages = []

def prompt(message)
  puts "==> #{message}"
end

def choose_language()
  loop do
    prompt("Choose your language: EN or DE")
    lang = gets.chomp
    if lang == "EN"
      return YAML.load_file('calculator_messages.yml')
      break
    elsif lang == "DE"
      return YAML.load_file('calculator_messages_DE.yml')
      break
    else
      prompt("We don't support that language.")
    end
  end
end

def valid_number?(num)
  num.to_f.to_s == num
  return num.to_f
end

def operation_to_message(operation)
  case operation
  when '+'
    "Adding"
  when '-'
    "Subtracting"
  when '*'
    "Multiplying"
  when '/'
    "Dividing"
  end
end

messages = choose_language()

loop do
  num1 = ""
  loop do
    prompt(messages['number1'])
    num1 = gets.chomp.to_f
    if valid_number?(num1)
      break
    else
      prompt(messages['number_error'])
    end
  end

  num2 = ""
  loop do
    prompt(messages['number2'])
    num2 = gets.chomp.to_f
    if valid_number?(num2)
      break
    else
      prompt(messages['number_error'])
    end
  end

  prompt(messages['operators'])
  operation = ""
  loop do
    operation = gets.chomp
    if %w(+ - / *).include?(operation)
      break
    else
      prompt(messages['operator_error'])
    end
  end

  prompt("#{operation_to_message(operation)} the two selected numbers....")

  result = case operation
           when '+'
             num1 + num2
           when '-'
             num1 - num2
           when '*'
             num1 * num2
           when '/'
             num1.to_f / num2.to_f
           end

  puts result
  prompt(messages['again'])
  answer = gets.chomp
  break unless answer.downcase().start_with?("y")
end
prompt(messages['thanks'])

# Further Questions
# 1. Use is_a? Integer
# 3. Maybe assign the result of the case statement to a variable
#
