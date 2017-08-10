class CandidatesController < ApplicationController

  def new
    @district = District.find(params[:district_id])
    @candidate = @district.candidates.new
  end

  def create
    @district = District.find(params[:district_id])
    @candidate = @district.candidates.new(candidate_params.merge(user: current_user))
    if @candidate.save
      redirect_to @district, notice: "#{@candidate.name} is ready to run for office!"
    else
      flash[:alert] = "I'm sorry, but your candidate profile did not have all the required info. Please try again."
      render :new
    end
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def edit
    @district = District.find(params[:district_id])
    @candidate = Candidate.find(params[:id])
    if @candidate.user != current_user
      flash[:alert] = "Only the owner of a candidate profile can edit it."
      redirect_to district_candidate_path(@candidate.district, @candidate)
    end
  end

  def update
    @district = District.find(params[:district_id])
    @candidate = Candidate.find(params[:id])
    if @candidate.user == current_user
      @candidate.update(candidate_params)
      if @candidate.save
        redirect_to district_candidate_path(@district, @candidate), notice: "#{@candidate.name}'s profile has been successfully updated!"
      else
        flash[:alert] = "#{@candidate.name}'s profile lacks the required info to update. Please try again."
        render :edit
      end
    else
      flash[:alert] = "Only the owner of a candidate profile can edit it."
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    if @candidate.user == current_user
      @candidate.destroy
      flash[:notice] = "#{@candidate.name}'s candidate profile has been deleted."
    else
      flash[:alert] = "Only the owner of a candidate profile can delete it."
    end
    redirect_to district_path(@candidate.district)
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :slogan, :img_url, :party, :about, :vote_count, :district_id, :user_id)
  end
end
