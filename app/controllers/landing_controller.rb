class LandingController < ApplicationController
  before_action :set_landing, only: [:index]
  def index
  end

  private

  def set_landing
    if params[:domain_id].nil?
      @projects = Project.all
    else
      @projects = Project.where domain_id: params[:domain_id]
    end
  end

  def landing_params
    params.require(:landing).permit(
      :domain_id
    )
  end
end

