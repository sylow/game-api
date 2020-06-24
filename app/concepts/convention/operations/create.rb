class Convention::Create < Trailblazer::Operation
  step :create

  def create(ctx, params:, **)
    ctx[:model] = Convention.create(name: params[:name], user: User.first)
  end
end