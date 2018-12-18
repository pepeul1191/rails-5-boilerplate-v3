class FileController < ApplicationController
  def upload
    rpta = []
    status = 200
    r = FileHelper::save(params[:file])
    if r[:tipo_mensaje] == 'success'
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => r[:mensaje],
        }
    else
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => r[:mensaje]
      }
    end
    render :plain => rpta.to_json, :status => status
  end
end
