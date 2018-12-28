class Access::PasswordController < ApplicationController
  def create
    status = 200
    lang = get_language()
    user_id = params[:user_id]
    activation = params[:key]
    key = Access::UserKey.where(
      :user_id => user_id,
      :activation => activation
    ).first()
    if key == nil
      redirect_to CONSTANTS[:base_url] + 'access/error/404'
      return nil
    end
    contents = get_content('password/create')[lang]
    @locals = {
      :title => get_titles()[lang]['password_create'],
      :message => '',
      :contents => contents,
      :user_id => user_id,
      :activation => activation,
      :message_type => '',
      :css => Access::PasswordHelper::create_css,
      :js => Access::PasswordHelper::create_js,
    }
    render template: 'access/password/create', layout: 'blank'
  end

  def create_post
    status = 500
    message = ''
    lang = get_language()
    message_type = 'color-error'
    _continue = true
    if params[:pass1] == '' || params[:pass2] == ''
      message = 'Debe ingrear ambas contraseñas'
    elsif params[:pass1] == params[:pass2] && params[:pass1] != ''
      begin
        message_type = 'color-success'
        # cambiar key
        key = Access::UserKey.where(
          :user_id => params[:user_id],
          :activation => params[:activation]
        ).first()
        key.activation = Assets::Randito.string_number(25)
        key.save
        # actualizar password de user
        user = Access::User.where(
          :id => params[:user_id],
        ).first()
        user.pass = Assets::Cipher.encrypt(CONSTANTS[:key], params[:pass1])
        user.user_state_id = 1
        user.save
        # render view
        contents = get_content('password/create')[lang]
        @locals = {
          :title => get_titles()[lang]['password_create_ok'],
          :contents => contents,
          :css => Access::PasswordHelper::create_css_ok,
          :js => Access::PasswordHelper::create_js,
        }
        render template: 'access/password/create_ok', layout: 'blank'
        return nil
      rescue Exception => e
        puts e.backtrace
        message = 'Ocurrió un error en crear la contraseña'
      end
    else
      message = 'Contraseñas no coniciden'
    end
    contents = get_content('password/create')[lang]
    @locals = {
      :title => get_titles()[lang]['password_create'],
      :message => message,
      :contents => contents,
      :user_id => params[:user_id],
      :activation => params[:activation],
      :message_type => message_type,
      :css => Access::PasswordHelper::create_css,
      :js => Access::PasswordHelper::create_js,
    }
    render template: 'access/password/create', layout: 'blank'
  end

  def update
    status = 200
    lang = get_language()
    user_id = params[:user_id]
    reset = params[:key]
    key = Access::UserKey.where(
      :user_id => user_id,
      :reset => reset
    ).first()
    if key == nil
      redirect_to CONSTANTS[:base_url] + 'access/error/404'
      return nil
    end
    contents = get_content('password/update')[lang]
    @locals = {
      :title => get_titles()[lang]['password_update'],
      :message => '',
      :contents => contents,
      :user_id => user_id,
      :reset => reset,
      :message_type => '',
      :css => Access::PasswordHelper::create_css,
      :js => Access::PasswordHelper::create_js,
    }
    render template: 'access/password/update', layout: 'blank'
  end

  def update_post
    status = 500
    message = ''
    lang = get_language()
    message_type = 'color-error'
    _continue = true
    if params[:pass1] == '' || params[:pass2] == ''
      message = 'Debe ingrear ambas contraseñas'
    elsif params[:pass1] == params[:pass2] && params[:pass1] != ''
      begin
        message_type = 'color-success'
        # cambiar key
        key = Access::UserKey.where(
          :user_id => params[:user_id],
          :reset => params[:reset]
        ).first()
        key.reset = Assets::Randito.string_number(25)
        key.save
        # actualizar password de user
        user = Access::User.where(
          :id => params[:user_id],
        ).first()
        user.pass = Assets::Cipher.encrypt(CONSTANTS[:key], params[:pass1])
        user.user_state_id = 1
        user.save
        # render view
        contents = get_content('password/create')[lang]
        @locals = {
          :title => get_titles()[lang]['password_create_ok'],
          :contents => contents,
          :css => Access::PasswordHelper::create_css_ok,
          :js => Access::PasswordHelper::create_js,
        }
        render template: 'access/password/create_ok', layout: 'blank'
        return nil
      rescue Exception => e
        puts e.backtrace
        message = 'Ocurrió un error en actualizar la contraseña'
      end
    else
      message = 'Contraseñas no coniciden'
    end
    contents = get_content('password/update')[lang]
    @locals = {
      :title => get_titles()[lang]['password_update'],
      :message => message,
      :contents => contents,
      :user_id => params[:user_id],
      :reset => params[:reset],
      :message_type => message_type,
      :css => Access::PasswordHelper::create_css,
      :js => Access::PasswordHelper::create_js,
    }
    render template: 'access/password/update', layout: 'blank'
  end
end
