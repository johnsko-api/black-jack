require 'pry'
class BlackJackCalculation
  def initialize(collection)
    @collection = collection
    @final_score = 0
    @num_aces = 0
    calculate_num_aces
    value
  end
  def final_score
    @final_score
  end
  def calculate_num_aces
    @collection.each do |card|
      if card.ace?
        @num_aces += 1
      end
    end
  end
  def value
    @collection.each do |card|
      if card.face_card?
        @final_score += 10
      else
        @final_score += card.rank.to_i
      end
    end
    case @num_aces
    when 1
      if @final_score >= 11
        @final_score += 1
      else
        @final_score += 11
      end
    when 2
      if @final_score >= 10
        @final_score += 2
      else
        @final_score += 12
      end
    when 3
      if @final_score >= 9
        @final_score += 3
      else
        @final_score += 13
      end
    when 4
      if @final_score >= 8
        @final_score += 4
      else
        @final_score += 14
      end
    end
  end
end
