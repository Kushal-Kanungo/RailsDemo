json.users do
  @users.each do |user|
    json.set! user.id do
      json.name user.username
    end
  end
end
