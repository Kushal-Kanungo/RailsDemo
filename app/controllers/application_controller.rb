class ApplicationController < ActionController::API
  # It will encode the payload
  # We created in 'Application Controller' so it will be available to all controller inheriting it
  def encode_token(payload)
    JWT.encode(payload, 'secret')
  end
end
