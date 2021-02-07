class ProfilesController < ApplicationController
 
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.create(comment_params)
    if @profile.valid?
      redirect_to  producer_path(current_producer.id)
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(current_producer.profile.id)
  end

  def update
    @profile = Profile.find(current_producer.profile.id)
    @profile.update(comment_params)
    redirect_to root_path
  end

  private
  def comment_params
    params.require(:profile).permit(:producer_comment, :image).merge(producer_id: current_producer.id)
  end

end
