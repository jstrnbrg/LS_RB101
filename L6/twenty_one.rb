require 'pry'

SCORE = {
  :player => 0,
  :dealer => 0
}

UPPERLIMIT = 21
LOWERLIMIT = 17

def initialise_deck
  cards = (2..10).to_a + ["J", "Q", "K", "A"]
  cards.each_with_object({}) do |card, deck_hash|
    deck_hash[card.to_s] = 4
  end
end

def deal_initial_cards!(deck)
  player_cards = []
  dealer_cards = []
  2.times do
    player_card = deck.keys.sample
    deck[player_card] -= 1
    player_cards << player_card
    dealer_card = deck.keys.sample
    deck[dealer_card] -= 1
    dealer_cards << dealer_card
  end
  return player_cards, dealer_cards
end

def deal_card!(deck)
  available_cards = deck.select { |_, v| v > 0 }
  card = available_cards.keys.sample
  deck[card] -= 1
  card
end

def determine_ace_value(sum)
  sum + 11 > UPPERLIMIT ? 1 : 11
end

def show_random_dealer_card(dealer_cards)
  dealer_cards.sample
end

def evaluate_cards_value(card_array)
  sum = 0
  not_aces = card_array.select { |card| card != "A" }
  aces = card_array.select { |card| card == "A" }
  not_aces.each do |card|
    sum += card.to_i if (2..10).include?(card.to_i)
    sum += 10 if ["J", "Q", "K", "A"].include?(card)
  end
  aces.each do
    sum += determine_ace_value(sum)
  end
  sum
end

def prompt(msg)
  puts "=> #{msg}"
end

def player_bust?(player_sum)
  player_sum > UPPERLIMIT ? true : false
end

def dealer_hit_or_stay?(dealer_sum)
  dealer_sum < LOWERLIMIT ? "hit" : "stay"
end

def evaluate_winner(player_sum, dealer_sum)
  if player_sum > UPPERLIMIT && dealer_sum > UPPERLIMIT
    "None"
  elsif player_sum > dealer_sum && player_sum <= UPPERLIMIT
    "Player"
  elsif player_sum > dealer_sum && player_sum > UPPERLIMIT
    "Dealer"
  elsif dealer_sum > player_sum && dealer_sum <= UPPERLIMIT
    "Dealer"
  elsif dealer_sum > player_sum && dealer_sum > UPPERLIMIT
    "Player"  
  else
    "Tie"
  end
end

def show_result(player_sum, dealer_sum)
  winner = evaluate_winner(player_sum, dealer_sum)
  prompt("Your score is #{player_sum}")
  prompt("The dealer's score is #{dealer_sum}")
  prompt("#{winner} won the round")
end

def update_score!(winner)
  if winner == "Player"
    SCORE[:player] += 1
  else
    SCORE[:dealer] += 1
  end
end

def show_end_result
  if SCORE[:player] == 5
    prompt("You won the game!!")
  else
    prompt("The computer won the game!!")
  end
end

loop do
  deck = initialise_deck
  player_cards, dealer_cards = deal_initial_cards!(deck)

  prompt("Current score: Player: #{SCORE[:player]}, Dealer: #{SCORE[:dealer]}")
  prompt("One of the dealer's cards is: #{show_random_dealer_card(dealer_cards)}")

  player_sum = 0
  loop do
    player_sum = evaluate_cards_value(player_cards)
    break if player_bust?(player_sum)
    prompt("You're cards are #{player_cards} with a total value of: #{player_sum}")
    prompt("Do you want to 'hit' or 'stay? Input 'h' or 's'")
    response = gets.chomp
    player_cards << deal_card!(deck) if response == 'h'
    break if response == 's'
  end

  dealer_sum = 0
  loop do
    dealer_sum = evaluate_cards_value(dealer_cards)
    response = dealer_hit_or_stay?(dealer_sum)
    dealer_cards << deal_card!(deck) if response  == "hit"
    break if response == "stay" || player_bust?(dealer_sum)
  end

  show_result(player_sum, dealer_sum)
  update_score!(evaluate_winner(player_sum, dealer_sum))
  prompt("============")
  break if SCORE[:player] == 5 || SCORE[:dealer] == 5
end

show_end_result
