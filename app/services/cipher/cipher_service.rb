class Cipher::CipherService < ::ApplicationService
  def initialize
    service = 'cipher'
    @base_url = SERVICES[service.to_sym][:url]
    @header_key = SERVICES[service.to_sym][:csrf_key]
    @header_val = SERVICES[service.to_sym][:csrf_value]
    @response = nil
    @error = nil
  end

  def encrypt(text_plain, key)
    begin
      @response = HTTParty.post(
        @base_url + 'encrypt',
        headers:{
          @header_key => @header_val,
          'Content-Type' => 'application/x-www-form-urlencoded',
          'charset' => 'utf-8'
        },
        body:{
          'data' => text_plain,
          'key' => key,
        }
      )
    rescue Errno::ECONNREFUSED => e
      @error = 'No hay conexión con el servicio'
    rescue Exception => e
      puts e.message
    end
  end
end
