class PomodoroController < ApplicationController
  
  def index
    @mute=params[:mute]
    if (@mute==nil)
    then
      @mute=false;
    end

    #cookies[:user_id] = {
    #  value: current_user.id,
    #  expires: 1.day.from_now,
    #  secure: Rails.env.production?
    #}


  end

    private
    def pomodoro_params
    	params.require(:pomodoro).permit(  :mute , :tiempo )
    end
end
