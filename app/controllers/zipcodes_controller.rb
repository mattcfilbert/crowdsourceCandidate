class ZipcodesController < ApplicationController
  def index
    @zipcodes = Zipcode.all
    @zipcode = Zipcode.new
  end

  def show
    @zipcode = Zipcode.find_by_zip(params[:zip])
  end
end
