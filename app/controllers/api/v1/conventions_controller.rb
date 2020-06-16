class Api::V1::ConventionsController < ApplicationController
  def index
    result = Convention::List.(params: params)
    render json: result[:model]
  end

  def create
    result = Convention::Create.(params: params)

    if result.success?
      render json: {result: true}
    else
      render json: {error: 'Oppsss', result: false}
    end
  end
end