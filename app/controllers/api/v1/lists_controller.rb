class Api::V1::ListsController < ApplicationController
  def add
    result = List::Add.(params: params)
    render json: 'works'
  end
end