class Convention::List < Trailblazer::Operation
  step :list
  
  def list(ctx, params:, **)
    ctx[:model] = Convention.all # todo: user
  end
end