require 'sequel'
require 'sqlite3'

Sequel::Model.plugin :json_serializer

DB_ACCESS_LOCAL = Sequel.connect('sqlite://db/access.db')
