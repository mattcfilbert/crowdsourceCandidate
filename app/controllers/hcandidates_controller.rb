class HcandidatesController < ApplicationController
  before_action :authenticate_user!

  def new
    @house = House.find(params[:house_id])
    @hcandidate = @house.hcandidates.new
  end

  def create
    @house = House.find(params[:house_id])
    @hcandidate = @house.hcandidates.new(hcandidate_params.merge(user: current_user))
    if @hcandidate.save
      redirect_to @house, notice: "#{@hcandidate.name} is ready to run for office!"
    else
      flash[:alert] = "I'm sorry, but your candidate profile did not have all the required info. Please try again."
      render :new
    end
  end

  def show
    @hcandidate = Hcandidate.find(params[:id])
  end

  def edit
    @house = House.find(params[:house_id])
    @hcandidate = Hcandidate.find(params[:id])
    if @hcandidate.user != current_user
      flash[:alert] = "Only the owner of a candidate profile can edit it."
      redirect_to house_hcandidate_path(@hcandidate.house, @hcandidate)
    end
  end

  def update
    @house = House.find(params[:house_id])
    @hcandidate = Hcandidate.find(params[:id])
    if @hcandidate.user == current_user
      @hcandidate.update(hcandidate_params)
      if @hcandidate.save
        redirect_to house_hcandidate_path(@house, @hcandidate), notice: "#{@hcandidate.name}'s profile has been successfully updated!"
      else
        flash[:alert] = "#{@hcandidate.name}'s profile lacks the required info to update. Please try again."
        render :edit
      end
    else
      flash[:alert] = "Only the owner of a candidate profile can edit it."
    end
  end

  def destroy
    @hcandidate = Hcandidate.find(params[:id])
    if @hcandidate.user == current_user
      @hcandidate.destroy
      flash[:notice] = "#{@hcandidate.name}'s candidate profile has been deleted."
    else
      flash[:alert] = "Only the owner of a candidate profile can delete it."
    end
    redirect_to house_path(@hcandidate.house)
  end

  private
  def hcandidate_params
    params.require(:hcandidate).permit(:name, :slogan, :img_url, :party, :about, :vote_count, :senate_id, :user_id)
  end
end
