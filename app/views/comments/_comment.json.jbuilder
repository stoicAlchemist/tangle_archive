json.extract! comment, :id, :content, :hidden, :flagged, :created_at, :updated_at
json.url comment_url(comment, format: :json)
