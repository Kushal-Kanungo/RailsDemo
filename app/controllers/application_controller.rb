class ApplicationController < ActionController::API
  # It will encode the payload
  # We created in 'Application Controller' so it will be available to all controller inheriting it
  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end

  def decode_token
    # Autherization : Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiMTIzIn0.AOXUao_6a_LbIcwkaZU574fPqvW6mPvHhwKC7Fatuws
    unless auth_header
      auth_header = # request.headers['Authorization']
      return
    end

    # extract the token
    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, 'secret', true, algorithm: 'HS256')
      # It will return like this : ? [{"user_id"=>"123"}, {"alg"=>"HS256"}]
    rescue JWT::DecodeError
      nil
    end
  end
end
