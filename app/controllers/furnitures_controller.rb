class FurnituresController < ApplicationController
  def index
    if params[:search]
      @furniture = Furniture.where("name LIKE ?", "%#{params[:search]}%")
    else
      @furniture = Furniture.all
    end
  end

  def show
    @furniture = Furniture.find(params[:id])
  end
end