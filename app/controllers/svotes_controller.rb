class SvotesController < ApplicationController

  def new
    @scandidate = Scandidate.find(params[:scandidate_id])
    @svote = @scandidate.svotes.new
  end

  def create
    @scandidate = Scandidate.find(params[:scandidate_id])
    @svote = @scandidate.svotes.new(svote_params)
    if @svote.save
      @scandidate.vote_count += 1
      @scandidate.save
      redirect_to @scandidate, notice: "You have successfully cast a vote for #{@scandidate.name}!"
    else
      flash[:alert] = "I'm sorry, but the reason your vote for #{@scandidate.name } did not meet the length requirements. Please try again!"
      render :new
    end
  end

  private
  def svote_params
    params.require(:svote).permit(:reason, :scandidate_id)
  end
end
