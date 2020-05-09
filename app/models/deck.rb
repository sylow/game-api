class Deck
  attr_reader :cards
  TYPES  = %w(spade heart diamond club).freeze
  VALUES = %w(A K Q J T 9 8 7 6 5 4 3 2).freeze
  CARD_VALUES = {'A': 4, 'K': 3, 'Q': 2, 'J': 1}

  def initialize
    reset
  end

  def reset
    @cards = []
    TYPES.each do |type|
      VALUES.each do |value|
        @cards << { type: type, value: value, point: CARD_VALUES.fetch(value.to_sym, 0) }
      end
    end
  end

  def pick
    @cards.delete_at(rand(@cards.length))
  end

  def reset_hand(cards)
    @cards << cards
  end
end