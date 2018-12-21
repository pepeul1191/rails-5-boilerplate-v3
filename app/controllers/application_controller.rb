class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :set_header

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

  private
  def set_header
    response.set_header('server', 'ruby, Ubuntu')
  end

  def get_content(path)
    YAML.load_file(RAILS_ROOT + '/app/contents/' + path + '.yml')
  end

  def get_titles()
    YAML.load_file(RAILS_ROOT + '/app/contents/_titles.yml')
  end

  def get_language()
    'sp'
  end
end
