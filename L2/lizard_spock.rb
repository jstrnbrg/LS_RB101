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

WINNING_SCORE = 5
DELAY = 1

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  winning_over = COMBINATIONS[first.to_sym]
  winning_over.include?(second)
end

def player_move
  choice = ''
  loop do
    prompt("Choose one of #{COMBINATIONS.keys.join(', ')}.")
    prompt("You can also use shortcuts e.g. 'r' for rock or 'sc' for scissor.")
    choice_input = gets.chomp
    choice = choices(choice_input)
    if COMBINATIONS.keys.to_s.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end
  choice
end

def computer_move
  COMBINATIONS.keys.sample.to_s
end

def display_results(winner)
  case winner
  when "player"
    prompt("You won")
  when "computer"
    prompt("Computer won")
  when "tie"
    prompt("It's a tie")
  end
end

def increment_score(winner)
  case winner
  when "player"
    SCORES[:player] += 1
  when "computer"
    SCORES[:computer] += 1
  end
end

def determine_winner(player, computer)
  if win?(player, computer)
    "player"
  elsif win?(computer, player)
    "computer"
  else
    "tie"
  end
end

def choices(choice_string)
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

def clear_screen
  prompt("Clearing screen in #{DELAY} seconds.")
  sleep(DELAY)
  system('clear') || system('cls')
end

def end_game?
  SCORES[:player] == WINNING_SCORE || SCORES[:computer] == WINNING_SCORE
end

loop do
  prompt(%(Current score:
    Player: #{SCORES[:player]}
    Computer: #{SCORES[:computer]}
    The game ends when the first player has a score of 5))
  choice = player_move()
  computer_choice = computer_move()

  winner = determine_winner(choice, computer_choice)

  display_results(winner)
  increment_score(winner)

  clear_screen()

  break if end_game?()
end

prompt(%(Thanks for playing!
    The final score is:
    Player: #{SCORES[:player]}
    Computer: #{SCORES[:computer]}))
