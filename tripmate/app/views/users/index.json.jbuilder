json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password_digest, :photo_path, :sex, :birthday, :nationality
  json.url user_url(user, format: :json)
end
