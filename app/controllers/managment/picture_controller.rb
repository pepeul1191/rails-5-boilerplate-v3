class Managment::PictureController < ApplicationController
  def list_by_client
    rpta = nil
    status = 200
    begin
      rpta = Managment::Picture.where(
          :client_id => params[:client_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los bancos',
          e.message
        ]
      }.to_json
      status = 500
    end
    render :plain => rpta, :status => status
  end

  def save
    rpta = nil
    status = 200
    data = JSON.parse(params[:data])
    nuevos = data['nuevos']
    editados = data['editados']
    eliminados = data['eliminados']
    client_id = data['extra']['client_id']
    rpta = []
    array_nuevos = []
    error = false
    execption = nil
    DB_MANAGMNET.transaction do
      begin
        if nuevos.length != 0
          nuevos.each do |nuevo|
            n = Managment::Picture.new(
              :description => nuevo['description'],
              :url => nuevo['url'],
              :client_id => client_id
            )
            n.save
            t = {
              :temporal => nuevo['id'],
              :nuevo_id => n.id
            }
            array_nuevos.push(t)
          end
        end
        if editados.length != 0
          editados.each do |editado|
            e = Managment::Picture.where(
              :id => editado['id'],
            ).first
            e.description = editado['description']
            e.url = editado['url']
            e.save
          end
        end
        if eliminados.length != 0
          eliminados.each do |eliminado|
            Managment::Picture.where(
              :id => eliminado
            ).delete
          end
        end
      rescue Exception => e
        Sequel::Rollback
        error = true
        execption = e
      end
    end
    if error == false
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => [
          'Se ha registrado los cambios en los imágenes del cliente',
          array_nuevos
          ]
        }.to_json
    else
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en guardar la tabla de imágenes',
          execption.message
          ]
        }.to_json
    end
    render :plain => rpta, :status => status
  end
end
