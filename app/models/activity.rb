class Activity < ActiveRecord::Base
  belongs_to :project

  def calc_time
    (ended_at - started_at).round
  end
end
