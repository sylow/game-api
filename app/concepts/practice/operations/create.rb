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
    result = []
    min, max = params[:range].split('..').collect{|x| x.to_i}
    loop do |deal|
      d = Deck.new
      d.deal_hands(params[:range])
      valid_hand = d.deal.select {|hand, value| value.points >= min && value.points <= min}.first
      if valid_hand.present?
        puts valid_hand.inspect
        ctx[:deal] = d.deal 
        ctx[:model].data = d.deal
        break
      end
    end
    true
  end

  def save(ctx, params:, **)
    ctx[:model].save
  end
end