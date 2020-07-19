class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:sending_destination)
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

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :image, :category_id, :condition_id, :postage_payer_id,
                                 :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end
end
