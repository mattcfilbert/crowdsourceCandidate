class ZipcodesController < ApplicationController
  def index
    @zipcode = Zipcode.new
  end

  def show
    @zipcode = Zipcode.find_by_zip(params[:zip])
  end

  def create
    redirect_to "/zipcodes/#{params[:zipcode][:zip]}"
  end
end
