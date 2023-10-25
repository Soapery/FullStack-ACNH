class PlayersController < ApplicationController
  def index
    if params[:search]
      @players = Player.where("username LIKE ?", "%#{params[:search]}%")
    else
      @players = Player.all
    end
  end

  def show
    @player = Player.find(params[:id])
  end
end