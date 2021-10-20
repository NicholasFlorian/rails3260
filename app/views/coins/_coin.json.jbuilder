json.extract! coin, :id, :fk_user_id, :denomination, :created_at, :updated_at
json.url coin_url(coin, format: :json)
