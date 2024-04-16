class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :redirect_unless_owner, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def destroy
  #  item = Item.find(params[:id])
  # item.destroy
  # redirect_to root_path
  # end

  def show
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_unless_owner
    redirect_to root_path unless @item.user == current_user
  end

  def item_params
    params.require(:item).permit(:image, :itemname, :description, :price, :category_id, :condition_id,
                                 :shipping_fee_responsibility_id, :prefecture_id, :shipping_duration_id).merge(user_id: current_user.id) # rubocop:disable Layout/LineLength
  end
end
