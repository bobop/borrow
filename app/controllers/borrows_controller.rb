class BorrowsController < ApplicationController
  def index
  end

  def new
    @borrow = Borrow.new
    if params[:item_id].present?
      @item = Item.find(params[:item_id])
    else
      @borrow.build_item
    end
  end

  def create
    @borrow = Borrow.new(params[:borrow])
    @borrow.item.user_id = current_user.id
    if @borrow.save
      @borrow.item.borrowed
      redirect_to items_path
    else
      if @borrow.item_id.present?
        @item = Item.find(@borrow.item_id)
      end
      render :new
    end
  end

  def edit
    @borrow = Borrow.find(params[:id])
  end

  def update
    @borrow = Borrow.find(params[:id])
    if @borrow.update_attributes(params[:borrow])
      @borrow.item.returned
      redirect_to items_path
    else
      if @borrow.item_id.present?
        @item = Item.find(@borrow.item_id)
      end
      render :new
    end
  end

end
