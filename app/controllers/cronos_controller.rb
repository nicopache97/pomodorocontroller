# app/controllers/cronos_controller.rb
class CronosController < ApplicationController
  respond_to :html
  before_action :authenticate_user!, except: [:index, :about]

  def index

    if current_user.present?
      @historial_data = current_user.cronos.order(id: :desc)
      @user_name =current_user.nombre;
      @horasUsadas=((current_user.uso_total)/3600).round(1); 
    end
    
    #cookies[:user_id] = {
    #  value: current_user.id,
    #  expires: 1.day.from_now,
    #  secure: Rails.env.production?
    #}

  end

  def create
    if current_user.nil?
    else
        @crono = Crono.new(crono_nuevo_params)
        @crono.user_id=current_user.id
        if @crono.save
            render json: { message: 'Crono creado exitosamente' }, status: :created
        else
            render json: { errors: @crono.errors.full_messages }, status: :unprocessable_entity
        end
    end
  end

  def actualizarUltimoCrono
    @crono = current_user.cronos.last
    if @crono.update(crono_actualiza_params)
      @crono.duracion
      total_segundos = 3600 * @crono.duracion.hour
      total_segundos += 60 * @crono.duracion.min
      total_segundos += @crono.duracion.sec
      current_user.uso_total+=total_segundos
      current_user.save
      render json: { status: 'success', message: 'Crono actualizado exitosamente' }
    else
      render json: { status: 'error', message: @crono.errors.full_messages.join(', ') }
    end
  end

  def update
    @crono = Crono.find(params[:id])
    if @crono.update(crono_actualiza_params)
      @crono.duracion
      total_segundos = 3600 * @crono.duracion.hour
      total_segundos += 60 * @crono.duracion.min
      total_segundos += @crono.duracion.sec
      current_user.uso_total+=total_segundos
      current_user.save
      render json: { status: 'success', message: 'Crono actualizado exitosamente' }
    else
      render json: { status: 'error', message: @crono.errors.full_messages.join(', ') }
    end
  end

  def borrar_crono
    if params[:id].nil?
    else
      @crono = Crono.find(params[:id])
      @crono.destroy
      head :no_content
    end
  end

  
  private

  def crono_actualiza_params
    params.require(:crono).permit(:finalizo, :duracion)
  end

  def crono_nuevo_params
    params.require(:crono).permit(:nombre, :fecha_inicio, :hora_inicio, :duracion, :finalizo)
  end

end
