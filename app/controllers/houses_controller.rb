class HousesController < ApplicationController
  def index
    @houses = House.all
  end
  def show
    @house = House.find(params[:id])
    @democrats = @house.hcandidates.where(party: "Democrat").order(vote_count: :desc)
    @republicans = @house.hcandidates.where(party: "Republican").order(vote_count: :desc)
    @independents = @house.hcandidates.where(party: "Independent").order(vote_count: :desc)
    @libertarians = @house.hcandidates.where(party: "Libertarian").order(vote_count: :desc)
    @greens = @house.hcandidates.where(party: "Green").order(vote_count: :desc)
    @others = @house.hcandidates.where(party: "Other").order(vote_count: :desc)
  end
end
