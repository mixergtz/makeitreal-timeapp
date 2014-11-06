module ActivitiesHelper


  def activity_pending?
    Activity.last && Activity.last.ended_at == nil
  end

end
