class Convention::Show < Trailblazer::Operation
  step :show
  
  def show(ctx, params:, **)
    ctx[:model] = Convention.find_by id: params[:id]
  end
end