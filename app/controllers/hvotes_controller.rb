class HvotesController < ApplicationController

  def new
    @hcandidate = Hcandidate.find(params[:hcandidate_id])
    @hvote = @hcandidate.hvotes.new
  end

  def create
    @hcandidate = Hcandidate.find(params[:hcandidate_id])
    @hvote = @hcandidate.hvotes.new(hvote_params)
    if @hvote.save
      @hcandidate.vote_count += 1
      @hcandidate.save
      redirect_to @hcandidate, notice: "You have successfully cast a vote for #{@hcandidate.name}!"
    else
      flash[:alert] = "I'm sorry, but the reason your vote for #{@hcandidate.name } did not meet the length requirements. Please try again!"
      render :new
    end
  end

  private
  def hvote_params
    params.require(:hvote).permit(:reason, :hcandidate_id)
  end
end
