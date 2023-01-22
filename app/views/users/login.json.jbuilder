json.data do
  json.user do
    json.name @user.username
  end
  json.token @token
end
