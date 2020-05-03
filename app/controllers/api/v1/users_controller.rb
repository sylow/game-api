class Api::V1::UsersController < ApplicationController
  def create
    result = User::SignUp.(params: params)

    if result.success?
      render json: {user: result[:model]}
    else
      render json: {error: 'Check your username and password', details: result["result.contract.default"].errors}
    end
  end
end