class VotesController < ApplicationController

  def new
    @candidate = Candidate.find(params[:candidate_id])
    @vote = @candidate.votes.new
  end

  def create
    @candidate = Candidate.find(params[:candidate_id])
    @vote = @candidate.votes.new(vote_params)
    if @vote.save
      @candidate.vote_count += 1
      @candidate.save
      redirect_to @candidate, notice: "You have successfully cast a vote for #{@candidate.name}!"
    else
      flash[:alert] = "I'm sorry, but the reason your vote for #{@candidate.name } did not meet the length requirements. Please try again!"
      render :new
    end
    # Consider later adding associations to the current user to prevent multiple votes
  end

  private
  def vote_params
    params.require(:vote).permit(:reason, :candidate_id)
  end
end
