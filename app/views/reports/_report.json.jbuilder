json.extract! report, :id, :name, :company_id, :preferred_day, :preferred_hour, :created_at, :updated_at
json.url report_url(report, format: :json)
