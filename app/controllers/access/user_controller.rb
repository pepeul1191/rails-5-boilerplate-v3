class Access::UserController < ApplicationController
  def create_from_managment
    user = params[:user]
    email = params[:email]
    status = 200
    begin
      temp_password = Assets::Randito.string_number(8)
      password = Assets::Cipher.encrypt(temp_password, CONSTANTS[:key])
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
          :base_url => SERVICES[:mobile_back][:url]
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
    user_id = data['user_id']
    systems = data['systems']
    rpta = []
    array_nuevos = []
    error = false
    execption = nil
    DB_ACCESS.transaction do
      begin
        systems.each do |sys|
          e = Access::UserSystem.where(
            :user_id => user_id,
            :system_id => sys['system_id'],
          ).first
          if sys['exist'] == false #borrar si existe
            Access::UserSystem.where(
              :user_id => user_id,
              :system_id => sys['system_id'],
            ).delete
          end
          if sys['exist'] == true
            if e == nil
              Access::UserSystem.new(
                :user_id => user_id,
                :system_id => sys['system_id'],
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
          :base_url => SERVICES[:mobile_back][:url]
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
        :base_url => SERVICES[:mobile_back][:url]
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
end
