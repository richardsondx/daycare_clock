class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @clock_events = @user.clock_events.where.not(created_at: nil)
    @clock_event = current_user.active_clock || current_user.clock_events.new
  end

  private 

  def authenticate_user!
    redirect_to root_path unless current_user && current_user.id == params[:id].to_i
  end

end
