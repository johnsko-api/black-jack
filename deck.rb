class Deck
  def initialize
    @collection = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @collection << Card.new(value, suit)
      end
    end
    @collection.shuffle!
  end

  def draw!
    @collection.pop
  end

end
