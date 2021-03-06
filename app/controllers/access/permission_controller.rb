class Access::PermissionController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Access::Permission.where(
          :system_id => params[:system_id]
        ).all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los permisos',
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
    system_id = data['extra']['system_id']
    rpta = []
    array_nuevos = []
    error = false
    execption = nil
    DB_ACCESS.transaction do
      begin
        if nuevos.length != 0
          nuevos.each do |nuevo|
            n = Access::Permission.new(
              :name => nuevo['name'],
              :description => nuevo['description'],
              :system_id => system_id,
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
            e = Access::Permission.where(
              :id => editado['id']
            ).first
            e.name = editado['name']
            e.description = editado['description']
            e.save
          end
        end
        if eliminados.length != 0
          eliminados.each do |eliminado|
            Access::Permission.where(
              :id => eliminado
          ).delete
          end
        end
      rescue Exception => e
        puts e.backtrace
        Sequel::Rollback
        error = true
        execption = e
      end
    end
    if error == false
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => [
          'Se ha registrado los cambios en los permisos',
          array_nuevos
          ]
        }.to_json
    else
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en guardar la tabla de permisos',
          execption.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end
end
