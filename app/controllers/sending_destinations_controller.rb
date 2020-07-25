class SendingDestinationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @sending_destination = ItemPayment.new
  end

  def create
    @sending_destination = ItemPayment.new(sending_destinations_params)
    if @sending_destination.valid?
      pay_item
      @sending_destination.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  
  def  sending_destinations_params
    params.require(:item_payment).permit(:post_code, :prefecture_id, :city, :house_number,
                  :building_name, :phone_number, :number, :exp_month, :exp_year, :cvc).merge(item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    @sending_destination = SendingDestination.find_by(item_id: @item.id)
    redirect_to root_path if @sending_destination.present? || current_user.id == @item.user_id
  end
end