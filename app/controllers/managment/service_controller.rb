class Managment::ServiceController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Managment::Service.all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los servicios',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end
end
