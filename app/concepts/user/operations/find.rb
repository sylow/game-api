class User::Find < Trailblazer::Operation
  step Model(User, :find_by)
end