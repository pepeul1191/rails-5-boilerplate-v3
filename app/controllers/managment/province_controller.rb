class Managment::ProvinceController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Managment::Province.select(:id, :name).where(
          :department_id => params[:deparment_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar las provincias del departamento',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end
end