class AuthController < ApplicationController
  def authenticate
    @user = User.find_by(name: params[:name])
    @user ||= User.create!(name: params[:name]) unless params[:name].empty?

    if @user
      session[:user_id] = @user.id
      flash[:notice] = 'Welcome back!'
      @clock_events = @user.clock_events.where.not(created_at: nil)
      @clock_event = current_user.active_clock || current_user.clock_events.new
      render 'users/show'
    else
      redirect_to root_path
    end
  end

  def new
    @users = User.all
    redirect_to user_path(current_user.id) if current_user
  end

  def delete
    session[:user_id] = nil
    flash[:notice] = 'You were successfully logged out'
    @users = User.all
    render :new
  end
end
