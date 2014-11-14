class ActivitiesController < ApplicationController
  before_action :redirect_not_logged


  def index

    if Activity.something_pending?
      @activity = Activity.last
    else
      @activity = Activity.new
    end

    @activities = Activity.pending

  end

  def create
    @activity = Activity.new(set_params)
    if @activity.save
      redirect_to dashboard_path
    else
      render "index"
    end
  end

  def edit
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update_attributes(set_params.merge(ended_at: DateTime.now))
    if @activity.save
      redirect_to dashboard_path
    else
      render "index"
    end
  end

  private

  def set_params
    params.require(:activity).permit(:description, :project_id)
  end


end
