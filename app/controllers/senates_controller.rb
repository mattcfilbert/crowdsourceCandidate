class SenatesController < ApplicationController
  def index
    @senates = Senate.all
  end
  def show
    @senate = Senate.find(params[:id])
    @democrats = @senate.scandidates.where(party: "Democrat").order(vote_count: :desc)
    @republicans = @senate.scandidates.where(party: "Republican").order(vote_count: :desc)
    @independents = @senate.scandidates.where(party: "Independent").order(vote_count: :desc)
    @libertarians = @senate.scandidates.where(party: "Libertarian").order(vote_count: :desc)
    @greens = @senate.scandidates.where(party: "Green").order(vote_count: :desc)
    @others = @senate.scandidates.where(party: "Other").order(vote_count: :desc)
  end
end
