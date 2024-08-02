class CreateManagersEventsJob
  include Sidekiq::Job

  def perform(manager_ids)
    manager_ids.each do |manager_id|
      CreateManagerEventsJob.perform_async(manager_id)
    end
  end
end
