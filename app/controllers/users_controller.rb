class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  # If you later want the abililty for a user to update their info, you will need
  # to have to either have this controller inherit from the Devise controller for
  # registrations, or run `rails g devise:controller registrations` to set it up
  # in your files.
end
