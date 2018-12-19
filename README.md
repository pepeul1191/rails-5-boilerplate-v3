# Rails BackEnd Canchas

Arrancer Puma con rerun:

    $ rails s

Nuevo controlador:

    $ rails generate controller error

Nuevo modelo

    $ rails generate model access_local/User

### Migraciones

Migraciones con DBMATE - accesos:

    $ dbmate -d "db/access-local/migrations/dml" -e "DATABASE_ACCESS_LOCAL" new <<nombre_de_migracion>>
    $ dbmate -d "db/access-local/migrations/dml" -e "DATABASE_ACCESS_LOCAL" up
    $ dbmate -d "db/access-local/migrations" -e "DATABASE_ACCESS_LOCAL" new <<nombre_de_migracion>>
    $ dbmate -d "db/access-local/migrations" -e "DATABASE_ACCESS_LOCAL" up

Migraciones con DBMATE - managment:

    $ dbmate -d "db/managment/migrations" -e "CANCHAS" new <<nombre_de_migracion>>
    $ dbmate -d "db/managment/migrations" -e "CANCHAS" up
    $ dbmate -d "db/managment/migrations" -e "CANCHAS" rollback

### Dump y Restore Mysql

    $ mysqldump -u root -p canchas > db/managment/canchas.sql
    $ mysql -u root -p canchas < db/managment/canchas.sql

---

Fuentes:

+ https://github.com/cyu/rack-cors/issues/119
+ https://edgeapi.rubyonrails.org/classes/ActionDispatch/Http/UploadedFile.html
+ https://guides.rubyonrails.org/command_line.html
+ https://docs.mongodb.com/mongoid/master/tutorials/mongoid-persistence/index.html
