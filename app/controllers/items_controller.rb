class ItemsController < ApplicationController
  before_action :find_item, only: :order

  
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

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def order

    redirect_to new_card_path and return unless current_customer.card.present?
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer_token = current_customer.card.customer_token 
    Payjp::Charge.create(
      amount: @item.price, 
      customer: customer_token, 
      currency: 'jpy' 
    )
    ItemOrder.create(item_id: params[:id],customer_id: current_customer.id)

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image).merge(producer_id: current_producer.id)
  end
  
  def find_item
    @item = Item.find(params[:id])
  end
end
