json.extract! score, :id, :game_id, :player_id, :hole_id, :strokes, :net, :points, :created_at, :updated_at
json.url score_url(score, format: :json)
