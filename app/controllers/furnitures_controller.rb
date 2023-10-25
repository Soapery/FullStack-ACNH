class FurnituresController < ApplicationController
  def index
    if params[:search]
      @furniture = Furniture.where("name LIKE ?", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
    else
      @furniture = Furniture.paginate(page: params[:page], per_page: 10)
    end
  end

  def show
    @furniture = Furniture.find(params[:id])
  end
end