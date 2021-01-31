class ItemsController < ApplicationController
  
  def index
    @item = Item.order(created_at: :desc).limit(5)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image).merge(producer_id: current_producer.id)
  end
  
end
