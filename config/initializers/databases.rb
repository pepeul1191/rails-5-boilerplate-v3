Sequel::Model.plugin :json_serializer

DB_ACCESS_LOCAL = Sequel.connect('sqlite://db/access.db')

DB_MANAGMNET = Sequel.connect(
  'mysql2://root:123@localhost/canchas',
  :max_connections=>5,
  :encoding=>'utf8',
)

DB_ACCESS = Sequel.connect(
  'mysql2://root:123@localhost/access',
  :max_connections=>5,
  :encoding=>'utf8',
)

Mongoid.configure do |config|
  config.clients.default = {
    hosts: ['localhost:27017'],
    database: 'schedules',
  }
  config.log_level = :warn
end

Mongoid.logger.level = Logger::DEBUG
Mongo::Logger.logger.level = Logger::INFO
