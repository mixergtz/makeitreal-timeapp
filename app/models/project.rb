class Project < ActiveRecord::Base
  belongs_to :user
  has_many :activities

  def total_time
    times = Project.joins(:activities).where("activities.project_id" => id).where('activities.ended_at IS NOT NULL').pluck(:started_at, :ended_at)

    if times.any?

      total = times.map!{ |x| x[1].to_time - x[0].to_time }.reduce {|k,v| k + v}.round
      "#{total} segundos"

    end

  end

end
