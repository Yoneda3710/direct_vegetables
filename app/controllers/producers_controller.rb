class ProducersController < ApplicationController

  def show
   @producer = Producer.find(params[:id])
   @items = @producer.items
   @profile = @producer.profile
  end
end
