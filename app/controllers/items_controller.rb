class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    # @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :itemname, :description, :price, :category_id, :condition_id,
                                 :shipping_fee_responsibility_id, :prefecture_id, :shipping_duration_id).merge(user_id: current_user.id)
  end
end
