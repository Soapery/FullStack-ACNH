class FurnituresController < ApplicationController
  def index
    @furnitures = Furniture.all
  end

  def show
    @furniture = Furniture.find(params[:id])
  end
end
