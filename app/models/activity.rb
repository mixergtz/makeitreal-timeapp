class Activity < ActiveRecord::Base
  belongs_to :project
  before_create :set_date

  scope :pending, ->{ all.where.not(ended_at: nil) }

  def calc_time
    (ended_at - started_at).round
  end

  def set_date
    self.started_at = DateTime.now
  end

  def self.something_pending?
    self.last && self.last.ended_at == nil
  end
end
