class Api::V1::FansController < ApplicationController

  def index
    @fans = Fan.all
    render json: @fans
  end

  def show
    @fan = Fan.find(params[:id])
    render json: @fan
  end

end
