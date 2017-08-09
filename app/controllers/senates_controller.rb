class SenatesController < ApplicationController
  def index
    @senates = Senate.all
  end
  def show
    @senate = Senate.find(params[:id])
  end
end
