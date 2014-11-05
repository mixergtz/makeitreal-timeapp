class ActivitiesController < ApplicationController
  before_action :redirect_not_logged

  def index
  end

  private

  def redirect_not_logged
    redirect_to login_path unless logged_in?
  end

end
