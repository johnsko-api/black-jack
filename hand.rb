require 'pry'
class Hand
attr_accessor :collection
  def initialize(collection)
    @collection = collection
  end

  def score
    # score = 0
    # @collection.each do |card|
    #   # puts card.rank
    #   score += BlackJackCalculation.new(card).value
    # end
    # score
    BlackJackCalculation.new(collection).final_score
  end
end
