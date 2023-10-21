class HomeFurnituresController < ApplicationController
  def index
    @home_furnitures = HomeFurniture.all
  end

  def show
    @home_furniture = HomeFurniture.find(params[:id])
  end
end
