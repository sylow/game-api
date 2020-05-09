class Api::V1::PracticesController < ApplicationController
  def create
    result = Practice::Create.(params: params)
    if result.success?
      render json: result[:model], include: 'deals.hands'
    else
      render json: {error: 'Check your username and password'}
    end
  end
end