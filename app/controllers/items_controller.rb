class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  private
  def item_params
    params.require(:item).permit(:product, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id )
  end
end
