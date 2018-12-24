class Mail::NotificationService < ApplicationService
  def initialize
    service = 'mail'
    @base_url = SERVICES[service.to_sym][:url]
    @header_key = SERVICES[service.to_sym][:csrf_key]
    @header_val = SERVICES[service.to_sym][:csrf_value]
    @response = nil
    @error = nil
  end

  def activation(data)
    begin
      @response = HTTParty.post(
        @base_url + 'password/create',
        headers:{
          @header_key => @header_val,
          'Content-Type' => 'application/x-www-form-urlencoded',
          'charset' => 'utf-8'
        },
        body:{
          'data' => data.to_json,
        }
      )
      if @response.code != 200
        body = @response.body
        raise Exception, 'Error al mandar el correo de activación. ' + body
      end
    rescue Errno::ECONNREFUSED => e
      @error = 'No hay conexión con el servicio'
      raise @error
    rescue Exception => e
      raise e.message
    end
  end
end
