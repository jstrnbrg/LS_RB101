VALID_CHOICES = ['rock', 'paper', 'scissor']

def test_method
  prompt('test message')
end

def win?(first, second)
  (first == 'rock') && (second == 'scissor') ||
    (first == 'paper') && (second == 'rock') ||
    (first == 'scissors') && (second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won")
  elsif win?(computer, player)
    prompt("Computer won")
  else
    prompt("It's a tie")
  end
end

def prompt(message)
  puts "=> #{message}"
end

test_method

loop do
  choice = ''
  loop do
    prompt("Choose one #{VALID_CHOICES.join(', ')} ")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_results(choice, computer_choice)

  prompt("You chose: #{choice}, the computer chose #{computer_choice}")

  prompt("Do you want to play again, press 'y'")
  answer = gets.chomp.downcase.strip
  break unless answer.start_with?('y')
end

prompt("Thanks for playing")
