class ZipcodesController < ApplicationController
  def index
    @zipcode = Zipcode.new
  end

  def show
    @zipcode = Zipcode.find_by_zip(params[:zip])
    @districts = @zipcode.districts
    @scandidates = @zipcode.senate.scandidates.order(vote_count: :desc).limit(3)
    @hcandidates = @zipcode.house.hcandidates.order(vote_count: :desc).limit(3)
  end

  def create
    redirect_to "/zipcodes/#{params[:zipcode][:zip]}"
  end
end
