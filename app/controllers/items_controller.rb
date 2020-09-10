class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end
 
  private
  def items_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :shopping_chipping_id, :area_of_delivary_id, :days_until_shopping_id, :price).merge(user_id: current_user.id)
  end
  
end
