class User::SignUp < Trailblazer::Operation
  step :model!
  step Contract::Build(constant: User::Contract::Create)
  step Contract::Validate()
  step Contract::Persist()

  def model!(ctx, params:, **)
    ctx[:model] = User.new
  end
end