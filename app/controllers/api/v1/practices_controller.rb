class Api::V1::PracticesController < ApplicationController
  def create
    result = Practice::Create.(params: params)
    if result.success?
      render json: result[:model], include: 'deals.hands'
    else
      render json: {error: 'Check your username and password'}
    end
  end

  def bookmark
    result = Practice::Bookmark.(params: params)
    render json: 'works'
  end
end