class Api::V1::ShowsController < ApplicationController

  def index
    @shows = Show.all.order('songkick_popularity DESC').limit(100)
    render json: @shows
  end

  def show
    @show = Show.find(params[:id])
    render json: @show
  end

end
