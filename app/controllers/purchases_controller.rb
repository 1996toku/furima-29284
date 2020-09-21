class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item

  def index
    @purchase = PurchaseStreetAddress.new
    redirect_to root_path if (current_user.id == @item.user_id) || (Purchase.find_by(item_id: params[:item_id]) != nil)
  end

  def create
    @purchase = PurchaseStreetAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:token, :postal_code, :city, :address, :phone_nunber, :building_name, :prefectures_id, :item_id, :authenticity_token).merge(price: Item.find(params[:item_id]).price, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: purchase_params[:price],  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
