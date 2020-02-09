# key defeats values
COMBINATIONS = {
  rock: ["lizard", "scissor"],
  paper: ["rock", "spock"],
  scissor: ["paper", 'lizard'],
  spock: ["scissor", "rock"],
  lizard: ["spock", "paper"]
}

SCORES = {
  player: 0,
  computer: 0
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  winning_over = COMBINATIONS[first.to_sym]
  winning_over.include?(second)
end

def increment_score(winner)
  if winner == "player"
    SCORES[:player] += 1
  elsif winner == "computer"
    SCORES[:computer] += 1
  end
end

def display_results(player, computer)
  if win?(player, computer)
    increment_score("player")
    prompt("You won")
  elsif win?(computer, player)
    increment_score("computer")
    prompt("Computer won")
  else
    prompt("It's a tie")
  end
end

def get_choice(choice_string)
  if choice_string.start_with?("r")
    "rock"
  elsif choice_string.start_with?("l")
    "lizard"
  elsif choice_string.start_with?("p")
    "paper"
  elsif choice_string.start_with?("sp")
    "spock"
  elsif choice_string.start_with?("sc")
    "scissor"
  else
    "No match"
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one of #{COMBINATIONS.keys.join(', ')}.")
    prompt("You can also use shortcuts e.g. 'r' for rock or 'sc' for scissor.")
    choice_input = gets.chomp
    choice = get_choice(choice_input)
    if COMBINATIONS.keys.to_s.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = COMBINATIONS.keys.sample.to_s

  display_results(choice, computer_choice)
  prompt("You chose: #{choice}, the computer chose #{computer_choice}")
  prompt("Scores: You: #{SCORES[:player]}  Computer: #{SCORES[:computer]}")

  if SCORES[:player] == 5
    prompt("You won the game!")
    break
  elsif SCORES[:computer] == 5
    prompt("The computer won the game!")
    break
  end
end

prompt("Thanks for playing")
