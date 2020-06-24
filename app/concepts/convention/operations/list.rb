class Convention::List < Trailblazer::Operation
  step :list
  
  def list(ctx, params:, **)
    ctx[:model] = Convention.order(:name) # todo: user
  end
end