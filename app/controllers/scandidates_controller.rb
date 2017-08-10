class ScandidatesController < ApplicationController
  before_action :authenticate_user!,
    :except => [:show]

  def new
    @senate = Senate.find(params[:senate_id])
    @scandidate = @senate.scandidates.new
  end

  def create
    @senate = Senate.find(params[:senate_id])
    @scandidate = @senate.scandidates.new(scandidate_params.merge(user: current_user))
    if @scandidate.save
      redirect_to @senate, notice: "#{@scandidate.name} is ready to run for office!"
    else
      flash[:alert] = "I'm sorry, but your candidate profile did not have all the required info. Please try again."
      render :new
    end
  end

  def show
    @scandidate = Scandidate.find(params[:id])
  end

  def edit
    @senate = Senate.find(params[:senate_id])
    @scandidate = Scandidate.find(params[:id])
    if @scandidate.user != current_user
      flash[:alert] = "Only the owner of a candidate profile can edit it."
      redirect_to senate_scandidate_path(@scandidate.senate, @scandidate)
    end
  end

  def update
    @senate = Senate.find(params[:senate_id])
    @scandidate = Scandidate.find(params[:id])
    if @scandidate.user == current_user
      @scandidate.update(scandidate_params)
      if @scandidate.save
        redirect_to senate_scandidate_path(@senate, @scandidate), notice: "#{@scandidate.name}'s profile has been successfully updated!"
      else
        flash[:alert] = "#{@scandidate.name}'s profile lacks the required info to update. Please try again."
        render :edit
      end
    else
      flash[:alert] = "Only the owner of a candidate profile can edit it."
    end
  end

  def destroy
    @scandidate = Scandidate.find(params[:id])
    if @scandidate.user == current_user
      @scandidate.destroy
      flash[:notice] = "#{@scandidate.name}'s candidate profile has been deleted."
    else
      flash[:alert] = "Only the owner of a candidate profile can delete it."
    end
    redirect_to senate_path(@scandidate.senate)
  end

  private
  def scandidate_params
    params.require(:scandidate).permit(:name, :slogan, :img_url, :party, :about, :vote_count, :senate_id, :user_id)
  end
end
