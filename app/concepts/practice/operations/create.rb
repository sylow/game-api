class Practice::Create < Trailblazer::Operation
  step Model(Practice, :new)
  step :assigns
  step :create_hands
  step :save
  def assigns(ctx, params:, **)
    ctx[:model].user = User.first
    ctx[:hands] = []
  end

  def create_hands(ctx, params:, **)
    deals = []
    1.upto(5) do
      d = Deck.new
      d.deal(params[:range])
      deals << d.hands
    end
    ctx[:model].data = deals    
  end

  def save(ctx, params:, **)
    ctx[:model].save
  end
end