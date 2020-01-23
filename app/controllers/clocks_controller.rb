class ClocksController < ApplicationController
  CLOCK_OPTIONS = %i[clock_in clock_out].freeze

  def index; end

  def new
    @clock = current_user.active_clock || current_user.clock_events.new
  end

  def edit; end

  def touch_clock
    option = option_params[:option].to_sym
    return unless CLOCK_OPTIONS.include? option
    clock_event = if params[:clock_id].present? 
                    current_user.clock_events
                      .find(params[:clock_id])  
                  else
                    initialize_clock
                  end
                  
    if clock_event.clock_it!(option)
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    clock_event = current_user.clock_events.find(params[:id])
    if clock_event
      clock_event.update(clock_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to user_path(current_user.id)
    end
  end

  def delete
    clock_event = current_user.clock_events.find(params[:clock_id])
    clock_event.destroy unless clock_event.nil?
    redirect_to user_path(current_user.id)
  end

  private

  def initialize_clock
    current_user.clock_events.new(params[:id])
  end

  def option_params
    params.permit(:option)
  end

  def clock_params
    params.require(:clock_events).permit!
  end
end
