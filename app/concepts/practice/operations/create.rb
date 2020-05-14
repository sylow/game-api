class Practice::Create < Trailblazer::Operation
  step Model(Practice, :new)
  step :assigns
  step :create_hands
  #step :save

  def assigns(ctx, params:, **)
    ctx[:model].user = User.first
    ctx[:model].kind = 'bidding'
  end

  def create_hands(ctx, params:, **)
    deals = []
    1.upto(5) do
      ctx[:model].deals << Deal::Practice.(params: { range: params[:range], deck: Deck.new})[:model]
    end
  end

  def save(ctx, params:, **)
    ctx[:model].save
  end
end