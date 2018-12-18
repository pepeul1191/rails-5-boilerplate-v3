require 'sequel'
require 'sqlite3'

Sequel::Model.plugin :json_serializer

DB_ACCESS_LOCAL = Sequel.connect('sqlite://db/access.db')

DB_MANAGMNET = Sequel.connect(
  'mysql2://root:123@localhost/canchas',
  :max_connections=>5,
  :encoding=>'utf8',
)
