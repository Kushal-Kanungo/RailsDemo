class UsersController < ApplicationController
  def register
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id }, Time.now.to_i + 120)
      render json: @user, status: :ok
    else
      render json: { error: @user.errors }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(username: user_params_login[:username])

    # authenticate method from bycrpt
    # same as @user && authenticate(user_params_login[:password])
    if @user&.authenticate(user_params_login[:password])
      # Create a token if password is correct
      token = encode_token({ user_id: @user.id }, Time.now.to_i + 120)
      render json: @user, token: token, status: :ok

    else
      render json: { error: 'Username Or Password is incorrect' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def user_params_login
    params.require(:user).permit(:username, :password)
  end
end
