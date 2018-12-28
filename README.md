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

Migraciones con DBMATE - access:

    $ dbmate -d "db/access/migrations" -e "ACCESS" new <<nombre_de_migracion>>
    $ dbmate -d "db/access/migrations" -e "ACCESS" up
    $ dbmate -d "db/access/migrations" -e "ACCESS" rollback

### Dump y Restore Mysql

    $ mysqldump -u root -p canchas > db/managment/canchas.sql
    $ mysql -u root -p canchas < db/managment/canchas.sql

### Uso de services

    c = Cipher::CipherService.new
    c.encrypt(params[:pass], CONSTANTS[:key])
    puts c.response.body
    puts c.response.code

### Scripts

    $ ruby scripts/cipher.rb


---

Fuentes:

+ https://github.com/cyu/rack-cors/issues/119
+ https://edgeapi.rubyonrails.org/classes/ActionDispatch/Http/UploadedFile.html
+ https://guides.rubyonrails.org/command_line.html
+ https://docs.mongodb.com/mongoid/master/tutorials/mongoid-persistence/index.html
+ https://stackoverflow.com/questions/40921032/way-to-load-folder-as-module-constant-in-rails-app-directory
+ https://stackoverflow.com/questions/42493686/how-to-require-modules-in-rails
+ https://stackoverflow.com/questions/37156226/how-can-i-add-a-services-directory-to-the-load-path-in-rails
+ https://gist.github.com/wteuber/5318013
