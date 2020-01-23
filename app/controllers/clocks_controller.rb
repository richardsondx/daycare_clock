class ClocksController < ApplicationController
  CLOCK_OPTIONS = %i[clock_in clock_out].freeze

  def edit
    @clock_event = current_user.clock_events.find(params[:id])
  end

  def touch_clock
    option = option_params[:option].to_sym
    reason = params[:reason]
    unless CLOCK_OPTIONS.include? option
      redirect_to root_path
      return
    end

    current_clock_event =  if params[:clock_id].present?
                              current_user.clock_events
                                .find(params[:clock_id])
                            else 
                              initialize_clock
                            end

    current_clock_event.clock_it!(option, reason)

    @clock_event = current_user.active_clock || current_user.clock_events.new
    @user = current_user
    @clock_events = @user.clock_events.where.not(created_at: nil)
    respond_to do |format|
      format.html { render 'users/show' }
      format.js
    end
  end

  def update
    current_clock_event = current_user.clock_events.find_by(id: params[:clock_id])
    if current_clock_event
      current_clock_event.update(clock_params)
      flash[:notice] = 'The clock event was updated.'
    else
      flash[:notice] = "The clock event failed to update. That clock event doesn't"
    end
    @user = current_user
    @clock_event = current_user.active_clock || current_user.clock_events.new
    @clock_events = @user.clock_events.where.not(created_at: nil)
    respond_to do |format|
      format.html { render 'users/show' }
      format.js
    end
  end

  def delete
    clock_event = current_user.clock_events.find(params[:clock_id])
    clock_event&.destroy
    flash[:notice] = 'The clock event was destroyed.'
    @user = current_user
    @clock_events = @user.clock_events.where.not(created_at: nil)
    @clock_event = current_user.active_clock || current_user.clock_events.new
    respond_to do |format|
      format.html { render 'users/show' }
      format.js
    end
  end

  private

  def initialize_clock
    current_user.clock_events.new(params[:id])
  end

  def option_params
    params.permit(:option)
  end

  def clock_params
    params.require(:clock_event).permit(:start_time, :end_time)
  end
end
