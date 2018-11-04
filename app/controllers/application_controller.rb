# frozen_string_literal: true

# General application controller, please only add stuff here that needs to be
# used system wide
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :authenticate

  def authenticate
    redirect_to(login_path) unless logged_in?
  end
end
