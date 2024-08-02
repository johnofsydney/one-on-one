class CreateEvent
  def initialize(manager:, report:)
    @manager = manager
    @report = report
  end

  def self.call(manager:, report:)
    new(manager:, report:).call
  end

  def call
    return unless valid?

    Event.create(
      manager:,
      report:,
      start_time:,
      end_time: start_time + Event::DURATION
    )
  end

  private

  def valid?
    return false if manager.nil? || report.nil?
    return false unless manager.company_id == report.company_id
    return false if manager_has_overlapping_event?

    true
  end

  attr_reader :manager, :report

  def start_time
    now = Time.zone.now
    preferred_day = report.preferred_day
    preferred_hour = report.preferred_hour

    next_date = now + ((preferred_day - now.wday) % 7)

    event_start = Time.new(next_date.year, next_date.month, next_date.day, preferred_hour).in_time_zone('Sydney')

    event_start.past? ? event_start + 7.days : event_start
  end

  def manager_has_overlapping_event?
    manager.events
           .where(start_time: start_time..(start_time + Event::DURATION))
           .exists?
  end
end