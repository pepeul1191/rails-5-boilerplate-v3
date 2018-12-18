class Managment::DistrictController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Managment::District.select(:id, :name, :latitude, :longitude).where(
          :province_id => params[:province_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los distritos de la provincia',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end
end
