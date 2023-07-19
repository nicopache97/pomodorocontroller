class PomodoroController < ApplicationController
  
  def index
    @mute=params[:mute]
    if (@mute==nil)
    then
      @mute=false;
    end
    @historial_data = [
      { nombreAlarma: "Alarma 1", fechaInicio: "2023-07-20", horaInicio: "10:00 AM", duracion: "5:00" },
      { nombreAlarma: "Alarma 2", fechaInicio: "2023-07-21", horaInicio: "11:30 AM", duracion: "5:00" },
      { nombreAlarma: "Alarma 3", fechaInicio: "2023-07-20", horaInicio: "10:00 AM", duracion: "15:00" },
      { nombreAlarma: "Alarma 4", fechaInicio: "2023-07-21", horaInicio: "11:30 AM", duracion: "45:00" },
      { nombreAlarma: "Alarma 5", fechaInicio: "2023-07-20", horaInicio: "10:00 AM", duracion: "10:00" },
      { nombreAlarma: "Alarma 6", fechaInicio: "2023-07-21", horaInicio: "11:30 AM", duracion: "45:00" },
      { nombreAlarma: "Alarma 7", fechaInicio: "2023-07-20", horaInicio: "10:00 AM", duracion: "10:00" },
      { nombreAlarma: "Alarma 11", fechaInicio: "2023-07-21", horaInicio: "11:30 AM", duracion: "45:00" },
      { nombreAlarma: "Alarma 14", fechaInicio: "2023-07-20", horaInicio: "10:00 AM", duracion: "10:00" },
      { nombreAlarma: "Alarma 21", fechaInicio: "2023-07-21", horaInicio: "11:30 AM", duracion: "45:00" },
      # Agregar más datos aquí...
    ]

    
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
