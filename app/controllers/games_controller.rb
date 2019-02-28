class GamesController < ApplicationController

  def index; end

  def create
    result = Services::PlayGame.new.perform(params[:throw])
    render json: result
  end

end