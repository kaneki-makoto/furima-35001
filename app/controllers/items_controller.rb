class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user), Item.order("created_at DESC")
  end

  def new
    if user_signed_in?
      render :new
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:product, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id )
  end
end
