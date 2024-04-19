class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :redirect_unless_owner, only: [:index]
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    set_item_id
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      set_item_id
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :street_address, :building_name,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    set_item_id
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_unless_owner
    set_item_id
    return unless @item.user

    redirect_to root_path unless user_signed_in? && @item.purchase.blank?
  end
end

def set_item_id
  @item = Item.find(params[:item_id])
end
