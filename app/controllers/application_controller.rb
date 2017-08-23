class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    # handle redirect
  end
  # Make sure to fill in this rescue function. Currently, when I search for a ZIP
  # that it can't find, it just breaks
end
