class Access::UserController < ApplicationController
  def create_from_managment
    user = params[:user]
    email = params[:email]
    status = 200
    begin
      temp_password = Assets::Randito.string_number(8)
      password = Assets::Cipher.encrypt(CONSTANTS[:key], temp_password)
      #create user if not exist
      count = Access::User.where(
        :user => user,
      ).count()
      if count == 0
        # create user
        n = Access::User.new(
          :user => user,
          :pass => password,
          :email => email,
          :user_state_id => 6, # email_pending
        )
        n.save
        # create activation key
        activation_key = Assets::Randito.string_number(25)
        Access::UserKey.new(
          :user_id => n.id,
          :activation => activation_key,
        ).save
        # mandar correo de activación
        mail = Mail::NotificationService.new
        data = {
          :user => user,
          :user_id => n.id,
          :activation_key => activation_key,
          :lang => 'sp',
          :to => email,
          :base_url => SERVICES[:mobile_back][:url] + 'password/create/'
        }
        mail.activation(data)
        # mensaje de respuesta
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha creado un usuario',
            n.id
          ]
        }.to_json
      else
        raise Exception, 'Nombre de usuario o contraseña ya se encuentra en uso.'
      end
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en crear el usuario',
          e.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end

  def system_save
    rpta = nil
    status = 200
    data = JSON.parse(params[:data])
    user_id = data['extra']['user_id']
    systems = data['editados']
    rpta = []
    array_nuevos = []
    error = false
    execption = nil
    DB_ACCESS.transaction do
      begin
        systems.each do |sys|
          puts sys
          e = Access::UserSystem.where(
            :user_id => user_id,
            :system_id => sys['id'],
          ).first
          if sys['existe'] == 0 #borrar si existe
            Access::UserSystem.where(
              :user_id => user_id,
              :system_id => sys['id'],
            ).delete
          end
          if sys['existe'] == 1
            if e == nil
              Access::UserSystem.new(
                :user_id => user_id,
                :system_id => sys['id'],
              ).save
            end
          end
        end
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha asociado los sistemas al usuario',
            ]
          }.to_json
      rescue Exception => e
        Sequel::Rollback
        error = true
        status = 500
        rpta = {
          :tipo_mensaje => 'error',
          :mensaje => [
            'Se ha producido un error en asociar los sistemas al usuario',
            e.message]
          }.to_json
      end
    end
    render :plain => rpta, :status => status
  end

  def search
    rpta = nil
    status = 200
    user_name = params[:user]
    begin
      e = Access::User.select(:id, :email, :user_state_id).where(
        :user => user_name,
      ).first
      if e == nil
        raise Exception, 'Usuario no registrado.'
      end
      rpta = e.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en obtener al usuario',
          e.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end

  def update_state
    rpta = nil
    status = 200
    user_id = params[:user_id]
    user_state_id = params[:user_state_id]
    begin
      e = Access::User.where(
        :id => user_id,
      ).first
      if e == nil
        raise Exception, 'Usuario no registrado.'
      else
        e.user_state_id = user_state_id
        e.save
      end
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => [
          'Se ha actualizado el estado del usuario',
          ]
        }.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en actualizar el estado del usuario',
          e.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end

  def update_email
    rpta = nil
    status = 200
    user_id = params[:user_id]
    email = params[:email]
    begin
      e = Access::User.where(
        :id => user_id,
      ).first
      if e == nil
        raise Exception, 'Usuario no registrado.'
      else
        m = Access::User.where(
          :email => email
        ).first
        if m == nil
          e.email = email
          e.save
        else
          if m.id.to_s == user_id.to_s
            e.email = email
            e.save
          else
            raise Exception, 'Correo ya registrado'
          end
        end
      end
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => [
          'Se ha actualizado el correo del usuario',
          ]
        }.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en actualizar el correo del usuario',
          e.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end

  def update_pass
    email = params[:email]
    status = 200
    begin
      #create user if not exist
      user = Access::User.where(
        :email => email,
      ).first
      if user != nil
        # update user reset key
        reset_key = Assets::Randito.string_number(25)
        e = Access::UserKey.where(
          :user_id => user.id
        ).first
        e.reset = reset_key
        e.save
        # mandar correo de activación
        mail = Mail::NotificationService.new
        data = {
          :user_id => user.id,
          :reset_key => reset_key,
          :lang => 'sp',
          :to => email,
          :base_url => SERVICES[:mobile_back][:url] + 'password/update/'
        }
        mail.reset_password(data)
        # mensaje de respuesta
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha enviado el correo de cambio de contraseña',
          ]
        }.to_json
      else
        raise Exception, 'Usuario no registrado.'
      end
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en mandar el correo de cambio de contraseña',
          e.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end

  def resend_activation
    email = params[:email]
    user_id = params[:user_id]
    user = params[:user]
    status = 200
    begin
      # get activation code
      e = Access::UserKey.where(
        :user_id => user_id
      ).first
      # mandar correo de activación
      mail = Mail::NotificationService.new
      data = {
        :name => user,
        :user_id => user_id,
        :activation_key => e.activation,
        :lang => 'sp',
        :to => email,
        :base_url => SERVICES[:mobile_back][:url] + 'key/activation/'
      }
      mail.resend_activation(data)
      # mensaje de respuesta
      rpta = {
        :tipo_mensaje => 'success',
        :mensaje => [
          'Se ha enviado el correo de activación de cuenta',
        ]
      }.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en mandar el correo de activación de cuenta',
          e.message]
        }.to_json
    end
    render :plain => rpta, :status => status
  end

  def system_list
    rpta = nil
    status = 200
    begin
      user_id = params[:user_id]
      rpta = DB_ACCESS.fetch('
        SELECT T.id AS id, T.name AS name, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe FROM
        (
          SELECT id, name, 0 AS existe FROM systems
        ) T
        LEFT JOIN
        (
          SELECT S.id, S.name, 1 AS existe FROM systems S
          INNER JOIN users_systems US ON S.id = US.system_id
          WHERE US.user_id =  ' + user_id + '
        ) P
        ON T.id = P.id').to_a.to_json
    rescue Exception => e
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los sistemas del usuario',
          e.message
        ]}.to_json
    end
    render :plain => rpta, :status => status
  end

  def role_list
    rpta = nil
    status = 200
    begin
      user_id = params[:user_id]
      system_id = params[:system_id]
      rpta = DB_ACCESS.fetch('
        SELECT T.id AS id, T.name AS name, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe FROM
        (
          SELECT id, name, 0 AS existe FROM roles WHERE system_id = ' + system_id + '
        ) T
        LEFT JOIN
        (
          SELECT P.id, P.name, 1 AS existe  FROM roles P
          INNER JOIN users_roles RP ON P.id = RP.role_id
          WHERE RP.user_id =  ' + user_id + '
        ) P
        ON T.id = P.id').to_a.to_json
    rescue Exception => e
      e.backtrace
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los roles del usuario',
          e.message
        ]}.to_json
    end
    render :plain => rpta, :status => status
  end

  def role_save
    data = JSON.parse(params[:data])
    editados = data['editados']
    user_id = data['extra']['user_id']
    rpta = []
    status = 200
    DB_ACCESS.transaction do
      begin
        if editados.length != 0
          editados.each do |editado|
            existe = editado['existe']
            role_id = editado['id']
            e = Access::UserRole.where(
              :role_id => role_id,
              :user_id => user_id
            ).first
            if existe == 0 #borrar si existe
              if e != nil
                e.delete
              end
            elsif existe == 1 #crear si no existe
              if e == nil
                n = Access::UserRole.new(
                  :role_id => role_id,
                  :user_id => user_id
                )
                n.save
              end
            end
          end
        end
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha registrado la asociación de roles al usuario',
          ]}.to_json
      rescue Exception => e
        Sequel::Rollback
        status = 500
        rpta = {
          :tipo_mensaje => 'error',
          :mensaje => [
            'Se ha producido un error en asociar los roles al usuario',
            e.message
          ]}.to_json
      end
    end
    render :plain => rpta, :status => status
  end

  def permission_list
    rpta = nil
    status = 200
    begin
      user_id = params[:user_id]
      system_id = params[:system_id]
      rpta = DB_ACCESS.fetch('
        SELECT T.id AS id, T.name AS name, (CASE WHEN (P.existe = 1) THEN 1 ELSE 0 END) AS existe, T.description AS description FROM
        (
          SELECT id, name, description, 0 AS existe FROM permissions WHERE system_id = ' + system_id + '
        ) T
        LEFT JOIN
        (
          SELECT P.id, P.name,  P.description, 1 AS existe  FROM permissions P
          INNER JOIN users_permissions RP ON P.id = RP.permission_id
          WHERE RP.user_id =  ' + user_id + '
        ) P
        ON T.id = P.id').to_a.to_json
    rescue Exception => e
      e.backtrace
      status = 500
      rpta = {
        :tipo_mensaje => 'error',
        :mensaje => [
          'Se ha producido un error en listar los permisos del usuario',
          e.message
        ]}.to_json
    end
    render :plain => rpta, :status => status
  end

  def permission_save
    data = JSON.parse(params[:data])
    editados = data['editados']
    user_id = data['extra']['user_id']
    rpta = []
    status = 200
    DB_ACCESS.transaction do
      begin
        if editados.length != 0
          editados.each do |editado|
            existe = editado['existe']
            permission_id = editado['id']
            e = Access::UserPermission.where(
              :permission_id => permission_id,
              :user_id => user_id
            ).first
            if existe == 0 #borrar si existe
              if e != nil
                e.delete
              end
            elsif existe == 1 #crear si no existe
              if e == nil
                n = Access::UserPermission.new(
                  :permission_id => permission_id,
                  :user_id => user_id
                )
                n.save
              end
            end
          end
        end
        rpta = {
          :tipo_mensaje => 'success',
          :mensaje => [
            'Se ha registrado la asociación de permisos al usuario',
          ]}.to_json
      rescue Exception => e
        Sequel::Rollback
        status = 500
        rpta = {
          :tipo_mensaje => 'error',
          :mensaje => [
            'Se ha producido un error en asociar los permisos al usuario',
            e.message
          ]}.to_json
      end
    end
    render :plain => rpta, :status => status
  end
end
