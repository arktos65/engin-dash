json.extract! currency, :id, :name, :code, :exchange_rate, :created_at, :updated_at
json.url currency_url(currency, format: :json)
