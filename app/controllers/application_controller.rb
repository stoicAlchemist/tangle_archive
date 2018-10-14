class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :authenticate

  def authenticate
    unless logged_in?
      redirect_to login_path
    end
  end

end
