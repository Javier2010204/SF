json.extract! service, :id, :code, :name, :description, :night_price, :day_price, :created_at, :updated_at
json.url service_url(service, format: :json)
