class Api::V1::SessionsController < ApplicationController
  def sign_in
    result = User::SignIn.(params: params)
    
    if result.success?
      render json: {user: result[:model], access_token: result[:access_token]}
    else
      render json: {error: 'Check your username and password'}
    end
  end
end