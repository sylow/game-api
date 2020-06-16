class Convention::Create < Trailblazer::Operation
  step :find_model
  step :create_deal

  def find_model(ctx, params:, **)
    ctx[:model] = List.first
  end

  def create_deal(ctx, params:, **)
    deal = Deal.create(dealer: params[:deal][:dealer], zone: params[:deal][:zone])
    params[:deal][:hands].each do |attrs|
      hand = deal.hands.create(seat: attrs[:seat], cards: attrs[:cards], points: attrs[:points])
    end
    ctx[:model].deals << deal
  end
end