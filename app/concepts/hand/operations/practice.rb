# params: { range: '15..17', deck: Deck.new, seat: 'west' }
class Hand::Practice < Trailblazer::Operation
  step :create_hand
  step :save

  def create_hand(ctx, params:, **)
    loop do
      hand = deal_seat(params[:deck], params[:seat])
      if in_range(hand, params[:range])
        ctx[:model] = hand      
        break
      end
      
      params[:deck].reset
    end
    true
  end 
  

  def save(ctx, params:, **)
    ctx[:model].save
  end

  #-----
  def deal_seat(deck, seat)
    model = Hand.new(seat: seat, cards: [], points: 0)
    1.upto(13) do
      model.cards << card = deck.pick 
      model.points += card[:point]
    end
    model.cards.sort_by!{|a| ::Deck::VALUES.index(a[:value])}
    model
  end

  def in_range(hand, range)
    return true if range.blank?
    
    min, max = range.split('..').collect{|x| x.to_i}
    (hand.points >= min) && (hand.points  <= max)    
  end  
end