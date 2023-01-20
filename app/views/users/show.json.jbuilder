json.users do
  @users.each do |user|
    json.set! user.id do
      json.name user.username
      json.books user.books
    end
  end
end
