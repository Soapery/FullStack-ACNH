class PlayerHomesController < ApplicationController
  def index
    @player_homes = PlayerHome.all
  end

  def show
    @player_home = PlayerHome.find(params[:id])
  end
end
