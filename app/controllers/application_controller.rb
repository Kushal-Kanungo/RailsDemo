class ApplicationController < ActionController::API
  # It will encode the payload
  # We created in 'Application Controller' so it will be available to all controller inheriting it
  def encode_token(payload, expiration)
    payload[:exp] = expiration
    JWT.encode(payload, 'secret')
  end

  # This function will extract the token from the request's header and than decode it
  def decode_token
    # Autherization : Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws
    auth_header = request.headers['Authorization']
    # extract the token
    return unless auth_header

    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, 'secret', true, algorithm: 'HS256')
      # It will return like this : ? [{"user_id"=>"123"}, {"alg"=>"HS256"}]
    rescue JWT::DecodeError
      nil
    end
  end

  # This method will find the User Object in the table by using user_id which was in token
  def authorized_user
    decoded_token = decode_token
    return unless decode_token

    user_id = decoded_token[0]['user_id']
    @user = User.find(user_id)
  end

  # This method will try authroize the user present in toke
  # If token is valid it will save the user in `@user` else render an error message
  def authorize
    render json: { message: 'You have to log in.' }, status: :unauthorized unless authorized_user
  end
end
