class CreateEventJob
  include Sidekiq::Job

  def perform(manager_id, report_id)
    manager = Manager.find(manager_id)
    report = Report.find(report_id)

    CreateEvent.call(manager:, report:)
  end
end
