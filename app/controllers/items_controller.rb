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

  def order
    @item = Item.find(params[:id])

    redirect_to new_card_path and return unless current_customer.card.present?

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    customer_token = current_customer.card.customer_token 
    Payjp::Charge.create(
      amount: @item.price, 
      customer: customer_token, 
      currency: 'jpy' 
    )
    ItemOrder.create(item_id: params[:id])

    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image).merge(producer_id: current_producer.id)
  end
  
end
