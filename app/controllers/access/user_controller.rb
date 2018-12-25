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
        )
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
end
