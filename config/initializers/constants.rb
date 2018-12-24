CONSTANTS = {
  :base_url => 'http://localhost:3000/',
  :static_url => 'http://localhost:3000/',
  :csrf => {
    :secret => 'mpt/sr6eS2AlCRHU7DVThMgFTN08pnfSDf/C94eZx7udfm0lvgaYWLYJttYPKzGKDTlXwVU/d2FOxbKkgNlsTw==',
    :key => 'Csrf_Val',
  },
  :key => 'qKoGzNISPAXWUZEd',
  :sistema_id => 4,
  :ambiente => 'desarrollo',
  :ambiente_static => 'desarrollo',
  :ambiente_csrf  => 'inactivo',
  :ambiente_session => 'activo',
  :key => 'qKoGzNISPAXWUZEd',
  :static => {
    :accesos => 'http://localhost:9090/',
    :archivos => '',
  },
  :upload => {
    :type => 'local',
    :url => 'http://localhost:3000/uploads/',
    :local => {
      :path => '/home/pepe/Documentos/Canchas/backend/public/uploads/',
    },
    :ftp => {
      :dominio => '192.168.1.43',
      :puerto => 22,
      :usuario => 'pepe',
      :contrasenia => 'kiki123',
      :ruta => '/home/pepe/Documentos/python/archivos/static/',
      :public => 'http://192.168.1.43:3031/'
    },
  },
}

SERVICES = {
  :managment => {
    :url => 'http://localhost:4000/',
    :csrf_key => 'csrf_val',
    :csrf_value => 'PKBcauXg6sTXz7Ddlty0nejVgoUodXL89KNxcrfwkEme0Huqtj6jjt4fP7v2uF4L',
  },
  :schedule => {
    :url => 'http://localhost:4300/',
    :csrf_key => 'csrf_val',
    :csrf_value => 'PKBcauXg6sTXz7Ddlty0nejVgoUodXL89KNxcrfwkEme0Huqtj6jjt4fP7v2uF4L',
  },
  :access => {
    :url => 'http://localhost:4100/',
    :csrf_key => 'csrf_val',
    :csrf_value => 'PKBcauXg6sTXz7Ddlty0nejVgoUodXL89KNxcrfwkEme0Huqtj6jjt4fP7v2uF4L',
  },
  :cipher => {
    :url => 'http://localhost:4200/',
    :csrf_key => 'csrf_val',
    :csrf_value => 'PKBcauXg6sTXz7Ddlty0nejVgoUodXL89KNxcrfwkEme0Huqtj6jjt4fP7v2uF4L',
  },
  :mail => {
    :url => 'http://softweb.pe/mail/canchas/',
    :csrf_key => 'csrf_val',
    :csrf_value => 'PKBcauXg6sTXz7Ddlty0nejVgoUodXL89KNxcrfwkEme0Huqtj6jjt4fP7v2uF4L',
  },
  :mobile_back => {
    :url => 'http://localhost:3000/',
    :csrf_key => 'csrf_val',
    :csrf_value => 'PKBcauXg6sTXz7Ddlty0nejVgoUodXL89KNxcrfwkEme0Huqtj6jjt4fP7v2uF4L',
  },
  :agricultor => 'http://localhost:3012/',
  :ubicaciones => 'http://localhost:3011/',
  :archivos => 'http://192.168.1.43:3031/',
  :ftp => {
    :dominio => '192.168.1.43',
    :puerto => 22,
    :usuario => 'pepe',
    :contrasenia => 'kiki123',
    :ruta => '/home/pepe/Documentos/python/archivos/static/',
    :public => 'http://192.168.1.43:3031/'
  },
  :estaciones => 'http://localhost:3025/',
  :sensores => 'http://localhost:3035/',
}

RAILS_ROOT = File.expand_path File.dirname(__FILE__) + '/../..'
