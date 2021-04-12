class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    if user_signed_in?
      render :new
    else
      redirect_to new_user_session_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:product, :explanation, :category_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id )
  end
end
