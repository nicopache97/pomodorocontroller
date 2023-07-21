# app/controllers/cronos_controller.rb
class CronosController < ApplicationController
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

  def update
    @crono = Crono.find(params[:id])
    
    if @crono.update(crono_actualiza_params)
      render json: { status: 'success', message: 'Crono actualizado exitosamente' }
    else
      render json: { status: 'error', message: @crono.errors.full_messages.join(', ') }
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
