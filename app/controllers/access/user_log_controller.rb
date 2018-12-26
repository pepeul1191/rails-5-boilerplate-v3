class Access::UserLogController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Access::UserLog.where(
          :user_id => params[:user_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los logs del usuario',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end
end
