class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :destroy]
  def  index
    @item = Item.all.order("id DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :category_id, :status_id, :delivery_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
  end


end
