json.extract! sale, :id, :number, :date, :state, :user_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
