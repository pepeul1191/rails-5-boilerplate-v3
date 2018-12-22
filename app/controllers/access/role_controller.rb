class Access::RoleController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Access::Role.all().to_a.to_json
    rescue Exception => e
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los roles',
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
    rpta = []
    array_nuevos = []
    error = false
    execption = nil
    DB_ACCESS.transaction do
      begin
        if nuevos.length != 0
          nuevos.each do |nuevo|
            n = Access::Role.new(
              :name => nuevo['name'],
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
            e = Access::Role.where(
              :id => editado['id']
            ).first
            e.name = editado['name']
            e.save
          end
        end
        if eliminados.length != 0
          eliminados.each do |eliminado|
            Access::Role.where(
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
          'Se ha registrado los cambios en los roles',
          array_nuevos
          ]
        }.to_json
    else
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en guardar la tabla de roles',
          execption.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end
end
