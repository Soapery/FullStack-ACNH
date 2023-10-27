class PlayerHomesController < ApplicationController
  def index
    @player_homes = PlayerHome.all
  end

  def show
    @player_home = PlayerHome.find(params[:id])
  end

  def filter_furniture
    @player_home = PlayerHome.find(params[:player_home_id])
    @furniture = @player_home.furniture.where("name LIKE ?", "%#{params[:search]}%")
  end
end