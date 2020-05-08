class Deck
  attr_reader :cards, :hands
  TYPES  = %w(spade heart diamond club).freeze
  VALUES = %w(A K Q J T 9 8 7 6 5 4 3 2).freeze
  CARD_VALUES = {'A': 4, 'K': 3, 'Q': 2, 'J': 1}

  def initialize
    reset
  end

  def reset
    @cards = []
    @hands = []
    TYPES.each do |type|
      VALUES.each do |value|
        @cards << { type: type, value: value, point: CARD_VALUES.fetch(value.to_sym, 0) }
      end
    end
  end

  def pick
    @cards.delete_at(rand(@cards.length))
  end

  def deal(range = nil)
    loop do
      hand = deal_seat("west")
      if in_range(hand, range)
        hands << hand      
        break
      else 
        reset
      end
    end

    (PlayerPosition::POSITIONS - ["west"]).each do |seat|
      hands << deal_seat(seat)
    end
  end

  private
  def deal_seat(seat)
    seat = { seat: seat, cards: [], points: 0 }
    1.upto(13) do
      seat[:cards] << card = pick 
      seat[:points] += card[:point]
    end
    seat[:cards].sort_by!{|a| ::Deck::VALUES.index(a[:value])}
    seat
  end

  def in_range(hand, range)
    return true if range.blank?
    
    min, max = range.split('..').collect{|x| x.to_i}
    (hand[:points] >= min) && (hand[:points] <= max)    
  end
end