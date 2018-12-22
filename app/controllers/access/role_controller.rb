class Access::RoleController < ApplicationController
  def list
    rpta = nil
    status = 200
    begin
      rpta = Access::Role.where(
          :system_id => params[:system_id]
        ).all().to_a.to_json
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
    system_id = data['extra']['system_id']
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

  def permission_list
    rpta = nil
    status = 200
    begin
      system_id = params['system_id']
      role_id = params['role_id']
      rpta = DB_ACCESS.fetch('
        SELECT T.id AS id, T.name AS name, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe, T.description AS description FROM
        (
          SELECT id, name, description, 0 AS existe FROM permissions WHERE system_id = ' + system_id + '
        ) T
        LEFT JOIN
        (
          SELECT P.id, P.name,  P.description, 1 AS existe  FROM permissions P
          INNER JOIN roles_permissions RP ON P.id = RP.permission_id
          WHERE RP.role_id =  ' + role_id + '
        ) P
        ON T.id = P.id').to_a.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los permisos del rol',
          e.message
        ]}.to_json
    end
    render :plain => rpta, :status => status
  end

  def permission_save
    data = JSON.parse(params[:data])
    editados = data['editados']
    role_id = data['extra']['role_id']
    rpta = []
    status = 200
    DB_ACCESS.transaction do
      begin
        if editados.length != 0
          editados.each do |editado|
            existe = editado['existe']
            permission_id = editado['id']
            e = Access::RolePermission.where(
              :permission_id => permission_id,
              :role_id => role_id
            ).first
            if existe == 0 #borrar si existe
              if e != nil
                e.delete
              end
            elsif existe == 1 #crear si no existe
              if e == nil
                n = Access::RolePermission.new(
                  :permission_id => permission_id,
                  :role_id => role_id
                )
                n.save
              end
            end
          end
        end
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha registrado la asociación de permisos al rol',
          ]}.to_json
      rescue Exception => e
        Sequel::Rollback
        status = 500
        rpta = {
          :tipo_mensaje => 'error',
          :mensaje => [
            'Se ha producido un error en asociar los permisos al rol',
            e.message
          ]}.to_json
      end
    end
    render :plain => rpta, :status => status
  end
end
