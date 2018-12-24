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
end
