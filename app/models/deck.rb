class Deck
  attr_reader :cards, :deal
  TYPES  = %w(spade heart diamond club).freeze
  VALUES = %w(A K Q J T 9 8 7 6 5 4 3 2).freeze
  CARD_VALUES = {'A': 4, 'K': 3, 'Q': 2, 'J': 1}

  def initialize
    @cards = []
    @deal = {}
    TYPES.each do |type|
      VALUES.each do |value|
        @cards << { type: type, value: value }
      end
    end
  end

  def pick
    @cards.delete_at(rand(@cards.length))
  end

  def deal_hands(range)
    PlayerPosition::POSITIONS.each do |seat|
      deal[seat] = OpenStruct.new(cards: [])
      1.upto(13) do
        deal[seat].cards << pick  
      end
      deal[seat].cards.sort_by!{|a| ::Deck::VALUES.index(a[:value])}
    end
    points
  end

  def points
    PlayerPosition::POSITIONS.each do |seat|
      deal[seat].points = 0
      deal[seat].cards.each do |card|
        deal[seat].points += CARD_VALUES.fetch(card[:value].to_sym, 0)
      end
    end
  end
end