json.extract! boat, :id, :name, :photo, :category, :city, :long, :lat, :price, :available, :user_id, :created_at, :updated_at
json.url boat_url(boat, format: :json)
