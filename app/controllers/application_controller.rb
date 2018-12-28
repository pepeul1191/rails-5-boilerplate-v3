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

  private
  def validate_csrf
    if CONSTANTS[:csrf_validation] == 'able'
      if request.headers[CONSTANTS[:csrf_validation][:key]] != CONSTANTS[:csrf_validation][:secret]
        rpta = {
  				:tipo_mensaje => 'error',
  				:mensaje => [
  					'No se puede acceder al recurso',
  					'csrf Token error'
  				]
  			}.to_json
  			status = 500
        render :plain => rpta, :status => status
      end
    end
  end

  private
  def session_true_view(system)
    if CONSTANTS[:session_validation] == 'able'
      if session[:systems] && (session[:systems].include? system)
        return nil
      else
        redirect_to CONSTANTS[:base_url] + 'error/access/5051'
      end
    end
  end

  private
  def session_true
    if CONSTANTS[:session_validation] == 'able'
      if session[:status] != 'active'
        redirect_to CONSTANTS[:base_url] + 'error/access/5051'
      end
    end
  end

  private
  def session_false_view(system)
    if CONSTANTS[:session_validation] == 'able'
      if session[:systems] && (session[:systems].include? system)
        url = CONSTANTS[:base_url]
        if session[:home]
          url = session[:home]
        else
          url = url + CONSTANTS[:home]
        end
        redirect_to url
      end
    end
  end

  private
  def session_true_rest
    if CONSTANTS[:session_validation] == 'able'
      if session[:status] != 'active'
        rpta = {
  				:tipo_mensaje => 'error',
  				:mensaje => [
  					'No se puede acceder al recurso',
  					'Necesita estar logueado'
  				]
  			}.to_json
  			status = 500
        render :plain => rpta, :status => status
      end
    end
  end
end
