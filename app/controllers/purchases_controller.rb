class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      pya_item
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefectures_id, :city, :address, :building, :number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pya_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    if current_user == @item.user
      redirect_to root_path
  end

end
