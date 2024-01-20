json.extract! player, :id, :first_name, :last_name, :phone_number, :created_at, :updated_at
json.url player_url(player, format: :json)
