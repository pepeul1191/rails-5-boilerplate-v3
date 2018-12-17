# Rails BackEnd Canchas

Arrancer Puma con rerun:

    $ rails s

Nuevo controlador:

    $ rails generate controller error

### Migraciones

Migraciones con DBMATE - accesos:

    $ dbmate -d "db/access-local/migrations/dml" -e "DATABASE_ACCESS_LOCAL" new <<nombre_de_migracion>>
    $ dbmate -d "db/access-local/migrations/dml" -e "DATABASE_ACCESS_LOCAL" up
    $ dbmate -d "db/access-local/migrations" -e "DATABASE_ACCESS_LOCAL" new <<nombre_de_migracion>>
    $ dbmate -d "db/access-local/migrations" -e "DATABASE_ACCESS_LOCAL" up

---

Fuentes:

+ http://padrinorb.com/
+ http://padrinorb.com/guides/generators/sub-applications/
+ https://stackoverflow.com/questions/26594897/override-not-found-sinatra-application
+ https://stackoverflow.com/questions/26515700/mysql-jdbc-driver-5-1-33-time-zone-issue
