class ZipcodesController < ApplicationController
  def index
    @zipcode = Zipcode.new
  end

  def show
    @zipcode = Zipcode.find_by_zip(params[:zip])
    @districts = @zipcode.districts
    @scandidates = @zipcode.senate.scandidates.order(vote_count: :desc).limit(3)
    @hcandidates = @zipcode.house.hcandidates.order(vote_count: :desc).limit(3)
    # Either add error handling logic here or update the one in ApplicationController
    # for cases where the ZIP cannot be found
  end

  def create
    redirect_to "/zipcodes/#{params[:zipcode][:zip]}"
  end
  # Is the above create method being used?
end
