class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end
  def show
    @district = District.find(params[:id])
    @democrats = @district.candidates.where(party: "Democrat").order(vote_count: :desc)
    @republicans = @district.candidates.where(party: "Republican").order(vote_count: :desc)
    @independents = @district.candidates.where(party: "Independent").order(vote_count: :desc)
    @libertarians = @district.candidates.where(party: "Libertarian").order(vote_count: :desc)
    @greens = @district.candidates.where(party: "Green").order(vote_count: :desc)
    @others = @district.candidates.where(party: "Other").order(vote_count: :desc)
  end
end
