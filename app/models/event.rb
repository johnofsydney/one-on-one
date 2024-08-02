class Event < ApplicationRecord
  DURATION = 30.minutes

  belongs_to :manager
  belongs_to :report
  has_many :notes

  validates :start_time, presence: true
  validates :end_time, presence: true

  def past?
    end_time < Time.zone.now
  end

  def future?
    start_time > Time.zone.now
  end

  def current?
    start_time < Time.zone.now && end_time > Time.zone.now
  end

  def status
    return 'past' if past?
    return 'future' if future?
    return 'current' if current?
  end

end
