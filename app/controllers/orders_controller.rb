class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new

    redirect_to root_path if current_user.id == @item.user_id || !@item.order.nil?
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      pay_item
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_number, :delivery_area_id, :city, :address, :apartment, :phone_number)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
