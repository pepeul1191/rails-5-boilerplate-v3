module FileHelper
  def self.save(file)
    rpta = ""
    begin
      url = ''
      file_name_array = file.path.split('/')
      extension = file_name_array.last.split('.').last
      new_name = Assets::Randito.string_number(50) + '.' + extension
      if CONSTANTS[:upload][:type] == 'local'
        FileUtils.mv(file.path, CONSTANTS[:upload][:local][:path] + new_name)
        url = CONSTANTS[:upload][:url]
      elsif CONSTANTS[:upload][:type] == 'ftp'
        #TODO
      end
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => {
          :mensaje => 'Se ha subido el archivo al servidor',
          :file_id => new_name,
          :file_url => url + new_name,
        },
      }
    rescue Exception => e
      puts e.backtrace
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en cargar el archivo en el servidor',
          e.message
        ]}
    end
    rpta
  end
end
