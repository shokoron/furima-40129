class ItemsController < ApplicationController
  def index
    @items = Item.all
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

  private # rubocop:disable Layout/EmptyLinesAroundAccessModifier
  def item_params
    params.require(:item).permit(
      :name, :description, :category_id, :condition_id,
      :shipping_charge_id, :shipping_area_id, :shipping_day_id,
      :price, :image
    ).merge(user_id: current_user.id)
  end
end
