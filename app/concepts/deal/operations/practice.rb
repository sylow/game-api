# params: { configuration: '1nt'}
class Deal::Practice < Trailblazer::Operation
  step Model(Deal, :new)
  step :assigns
  step :save
  step :create_hands

  def assigns(ctx, params:, **)
    ctx[:model].zone = DealZone::ZONES.sample 
    ctx[:model].dealer = PlayerPosition::POSITIONS.sample    
    ctx[:deck] = Deck.new
  end

  def create_hands(ctx, params:, **)
    attributes = { deck: ctx[:deck], deal: ctx[:model] }
    ctx[:model].hands << Hand::Practice.( params: attributes.merge!(range: params[:range], seat: 'west') )[:model]

    (PlayerPosition::POSITIONS - ["west"]).each do |seat|
      ctx[:model].hands << Hand::Practice.( params: attributes.merge!(range: nil, seat: seat) )[:model]
    end
  end

  def save(ctx, params:, **)
    ctx[:model].save
  end
end