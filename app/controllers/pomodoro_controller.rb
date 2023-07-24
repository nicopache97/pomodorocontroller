class PomodoroController < ApplicationController
  
  def index

    if current_user.present?
      @historial_data = current_user.cronos.order(id: :desc)
      @user_name =current_user.nombre;
      @horasUsadas=(1.1812319).round(1);
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
