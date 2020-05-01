require 'pry'

INITIAL_MARKER = " "
USER_MARKER = "X"
COMPUTER_MARKER = "O"

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

SCORE = {"Player" => 0, "Computer" => 0}

PLAYER_FIRST_NEXT = "choose"

def prompt(msg)
  puts "=> #{msg}"
end

def initialise_board
  board = {}
  (1..9).each { |i| board[i] = INITIAL_MARKER }
  board
end

def print_board(brd)
  system('clear')
  print_score
  puts "You're the '#{USER_MARKER}', the computer is the '#{COMPUTER_MARKER}'"
  puts " #{brd[1]}|#{brd[2]}|#{brd[3]} "
  puts "--+-+--"
  puts " #{brd[4]}|#{brd[5]}|#{brd[6]} "
  puts "--+-+--"
  puts " #{brd[7]}|#{brd[8]}|#{brd[9]} "
end

def empty_squares(board)
  board.keys.select { |key| board[key] == INITIAL_MARKER }
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(line[0], line[1], line[2]).count(USER_MARKER) == 3
      return "Player"
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3 #splat operator turns array into individual elements
      return "Computer"
    end
  end
  nil
end

def someone_won?(board)
  !!detect_winner(board)
end

def joinor(square_arr, delimiter =  ", ", last_word =  "or")
  "#{square_arr[0..-2].join(delimiter)} #{last_word} #{square_arr[-1]}"
end

def user_mark_board!(board)
  square = ''
  loop do
    prompt("Choose a square out of: #{joinor(empty_squares(board))}")
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt("not a valid choice")
  end
  board[square] = USER_MARKER
end

def computer_mark_board!(board)
  square = 0
  ## Offensive
  if !!immediate_threat(board, COMPUTER_MARKER)
    square = immediate_threat(board, COMPUTER_MARKER)
  # Defensive
  elsif !!immediate_threat(board, USER_MARKER)
    square = immediate_threat(board, USER_MARKER)
  # Pick square 5 if available
  elsif board[5] == " "
      board[5] = COMPUTER_MARKER
  # chose random
  else
    square = empty_squares(board).sample
  end
  board[square] = COMPUTER_MARKER
end

def print_score
  prompt("Current score: Player: #{SCORE["Player"]} Computer: #{SCORE["Computer"]}")
end

def score_five?
  SCORE["Computer"] == 5 || SCORE["Player"] == 5
end

def immediate_threat(board, marker)
  WINNING_LINES.each do |line|
    values = board.values_at(*line)
    if values.count(marker) == 2
      return nil if values.count(INITIAL_MARKER) == 0
      index = values.index(" ")
      return line[index]
    end
  end
  nil
end

def determine_first_player!
  prompt("Who should start? 'Player' or 'Computer'")
  response = gets.chomp
end

def play_a_round(board, current_player)
  if current_player == "Player"
    user_mark_board!(board)
  elsif current_player == "Computer"
    computer_mark_board!(board)
  end
end

def alternate_player(current_player)
  if current_player == "Player"
    "Computer"
  elsif current_player == "Computer"
    "Player"
  end
end

current_player = determine_first_player!
loop do
  board = initialise_board
  loop do
    print_board(board)

    play_a_round(board, current_player)
    current_player = alternate_player(current_player)

    break if someone_won?(board) || empty_squares(board).empty?
  end

  print_board(board)

  if someone_won?(board)
    winner = detect_winner(board)
    SCORE[winner] += 1
    prompt("#{winner} won")
  else
    prompt("it's a tie")
  end
  sleep(2)
  break if score_five?
end

print_score
prompt("Thanks for playing. Goodbye ")
