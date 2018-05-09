class Api::V1::AttendsController < ApplicationController

  def index
    @attends = Attend.all
    render json: @attends
  end

  def show
    @attend = Attend.find(params[:id])
    render json: @attend
  end

end
