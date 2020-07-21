class SendingDestinationsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    sending_destinations = Sending_destinations.new(sending_destinations_params)
    if sending_destinations.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def  sending_destinations_params
    params.require(:sending_destinations).permit(:post_code, :prefecture_id, :city, :house_number,
                                                 :building_name, :phone_number).merge(item_id: params[:item_id])
  end
end
