require 'pry'
require_relative 'deck'
require_relative 'hand'
require_relative 'blackjack_calculation'
require_relative 'card'

deck = Deck.new
####FIRST CARDS DEALT##################
card_1 = deck.draw!
card_2 = deck.draw!
card_3 = deck.draw!
card_4 = deck.draw!
####PLAYER//DEALER HAND################
player_hand = Hand.new([card_1, card_3])
dealer_hand = Hand.new([card_2, card_4])
####VARIABLES TO MAKE CODE CLEANER######
show_card = dealer_hand.collection[1]
hidden_card = dealer_hand.collection[0]

puts "Your Hand" ;sleep 2
player_hand.collection.each do |card|
  puts "|#{card.rank}#{card.suit}|" ;sleep 1
end
puts "Your Score: #{player_hand.score}" ;sleep 1
puts "Dealer's Hand" ;sleep 2
puts "|  |" ;sleep 1
puts "|#{show_card.rank}#{show_card.suit}|" ;sleep 1

if (player_hand.score == 21) & (dealer_hand.score == 21)
  puts "Dealer Flips Over |#{hidden_card.rank}#{hidden_card.suit}|" ;sleep 1
  puts "Dealers score: #{dealer_hand.score}" ;sleep 1
  puts 'PUSH' ;sleep 1
elsif dealer_hand.score == 21
  puts "Dealer Flips Over |#{hidden_card.rank}#{hidden_card.suit}|" ;sleep 1
  puts "Dealers score: #{dealer_hand.score}" ;sleep 1
  puts 'You Lose: Dealer BLACKJACK!' ;sleep 1
elsif player_hand.score == 21
  puts "Dealer Flips Over |#{hidden_card.rank}#{hidden_card.suit}|" ;sleep 1
  puts "Dealers score: #{dealer_hand.score}" ;sleep 1
  puts 'Win: BLACKJACK' ;sleep 1
else
  choice = ''
  until player_hand.score > 21
    sleep 1
    puts 'Hit:(h) or Stand:(s)' ;sleep 1
    choice = gets.chomp.downcase
    if choice == 'h'
      sleep 1
      puts "HIT ME!!!!!" ;sleep 1
      player_hand.collection << deck.draw!
      hit_card = player_hand.collection.last
      puts "You drew |#{hit_card.rank}#{hit_card.suit}|" ;sleep 1
      puts "Your New Score is: #{player_hand.score}" ;sleep 1
    elsif choice == "s" || player_hand.score == 21
      sleep 1
      puts "Dealer Flips Over |#{hidden_card.rank}#{hidden_card.suit}|" ;sleep 1
      puts "Dealers score: #{dealer_hand.score}" ;sleep 1
      break
    else
    end
  end
  if player_hand.score > 21
    sleep 1
    puts 'YOU JUST BUST YOU FOOL'
  else
    while player_hand.score <= 21
      until dealer_hand.score >= 17
        dealer_hand.collection << deck.draw!
        dealt_hand = dealer_hand.collection.last
        sleep 1
        puts "Dealer drew a |#{dealt_hand.rank}#{dealt_hand.suit}|" ;sleep 1
        puts "Dealers new score: #{dealer_hand.score}"
      end
      if dealer_hand.score > 21
        sleep 1
        puts "Dealers score: #{dealer_hand.score}" ;sleep 1
        puts "Dealer Bust, You win"
        break
      elsif player_hand.score > dealer_hand.score
        sleep 1
        puts "You Beat Dealer, You Win"
        break
      elsif player_hand.score < dealer_hand.score
        sleep 1
        puts "Dealer Beat You, You Lose"
        break
      else
        sleep 1
        puts "BORING!! Push"
        break
      end
    end
  end
end
