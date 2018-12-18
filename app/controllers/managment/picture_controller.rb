class Managment::PictureController < ApplicationController
  def list_by_client
    rpta = nil
    status = 200
    begin
      rpta = Managment::Picture.where(
          :client_id => params[:client_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los bancos',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end
end
