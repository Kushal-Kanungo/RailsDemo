json.extract! @user, :fullname, :company, :email

json.data do
  json.user do
    json.set @user.username
  end
  json.token @token
end
