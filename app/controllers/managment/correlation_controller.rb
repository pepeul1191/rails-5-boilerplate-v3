class Managment::CorrelationController < ApplicationController
  def client_create
    rpta = nil
    status = 200
    begin
      n = Managment::ClientCorrelation.new
      n.save
      rpta = n.id
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en crear el correlativo del cliente',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end
end
