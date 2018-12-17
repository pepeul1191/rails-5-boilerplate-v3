class ApplicationController < ActionController::Base
  def not_found
    case request.method
    when 'GET'
      extensiones_archivos = ['css', 'js', 'png', 'img', ]
      request_array = request.original_url.split('.')
      extension = request_array[request_array.length - 1]
      if !extensiones_archivos.include? extension
        redirect_to CONSTANTS[:base_url] + 'error/access/404'
      end
    when 'POST'
      render :plain => {
        :tipo_mensaje => 'error',
        :mensaje => [
          '404: Recurso no encontrado',
          ]
        }.to_json, status: 500
    end
  end

  def get_content(path)
    YAML.load_file(RAILS_ROOT + '/app/contents/' + path + '.yml')
  end

  def get_language()
    'sp'
  end
end
