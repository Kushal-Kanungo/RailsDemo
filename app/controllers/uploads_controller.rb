class UploadsController < ApplicationController
  def upload
    path = File.join(upload, name)
    File.open(path, 'wb') { |f| f.write(params[:avatar].read) }
  end

  private

  def upload_params
    params.require(:user).permit(:username, :password, :password_confirmation, :avatar)
  end
end
