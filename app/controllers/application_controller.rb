class ApplicationController < ActionController::Base
    def orden_actual
        if current_usuario # preguntar con devise si tenemos una sesión
            orden = Orden.where(usuario_id: current_usuario.id).where(estado: 'creado').last
            if orden.nil?
                orden = Orden.create(usuario: current_usuario, estado: 'creado')
            end
            return orden
        end
        nil
    end
end
