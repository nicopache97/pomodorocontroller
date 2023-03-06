class PomodoroController < ApplicationController
    def index
        
    end

    def new
        @pomo= Pomodoro.new
        @pomo.nombre="pomodoro para concentrarme en ..."
        @pomo.tim_1=20.0
    end
    
    def create
        puts << @pomo.json
    end
end
