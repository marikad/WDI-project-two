json.array!(@lists) do |list|
  json.extract! list, :id, :title, :description, :movie_id, :user_id, :show_id
  json.url list_url(list, format: :json)
end
