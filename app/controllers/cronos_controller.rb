# app/controllers/cronos_controller.rb
class CronosController < ApplicationController
  def create
    if current_user.nil?
    else
        @crono = Crono.new(crono_params)
        @crono.user_id=current_user.id
        if @crono.save
            render json: { message: 'Crono creado exitosamente' }, status: :created
        else
            render json: { errors: @crono.errors.full_messages }, status: :unprocessable_entity
        end
    end
  end

  private
  def crono_params
    params.require(:crono).permit(:nombre, :fecha_inicio, :hora_inicio, :duracion, :finalizo)
  end

end
