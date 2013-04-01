class ItemsController < ApplicationController
  def index
    @items = current_user.items
    @item = Item.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = current_user.items.find(params[:id])
  end

  def update
    @item = current_user.items.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to items_path
    else
      render :edit
    end
  end
end
