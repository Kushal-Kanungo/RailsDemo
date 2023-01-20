json.data do
  json.user do
    json.call(
      @user,
      :id,
      :username
    )
  end
  json.token @token
end
