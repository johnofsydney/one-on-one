class CreateManagerEventsJob
  include Sidekiq::Job

  def perform(manager_id)
    reports_ids = Report.where(manager_id: manager_id).pluck(:id)

    reports_ids.each do |report_id|
      CreateEventJob.perform_async(manager_id, report_id)
    end
  end
end
