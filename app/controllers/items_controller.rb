class ItemsController < ApplicationController
  before_action :move_to_registration, only: [:new]

  def index
    @item = Item.includes(:user)
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

  private

  def item_params
    params.require(:item).permit(:name, :content, :category_id, :status_id, :delivery_charge_id, :delivery_area_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_registration
    redirect_to new_user_session_path unless user_signed_in?
  end
end
