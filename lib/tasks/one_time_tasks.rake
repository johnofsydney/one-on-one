namespace :onboard do
  desc 'Onboard Widget Co. data'
  task widget_co: :environment do
    manager_ids = Manager.joins(:company).where(companies: { name: 'Widget Co' }).pluck(:id)

    CreateManagersEventsJob.perform_async(manager_ids)
  end
end
