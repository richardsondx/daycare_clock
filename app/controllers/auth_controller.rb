class AuthController < ApplicationController
  def authenticate
    user = User.find_by(name: params[:name])
    user ||= User.create!(name: params[:name]) unless params[:name].empty?
    
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to root_path
    end
  end

  def new
    redirect_to user_path(current_user.id) if current_user
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
